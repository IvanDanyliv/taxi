module Admin
  class DriversController < BaseController
    before_action { @page_title = 'DRIVERS' }

    def index
      @search = DriverSearchForm.new(search_params)
      @drivers = @search.perform(params[:page], limit: params[:limit], csv: request.format == :csv)
    end

    def show
      @driver = Driver.find(params[:id])
    end

    def new
      @driver = Driver.new
    end

    def create
      @driver = Driver.new
      @driver.assign_attributes(post_params)
      if @driver.save
        flash.now[:notice] = t('infold.flash.created')
        render :form
      else
        flash.now[:alert] = t('infold.flash.invalid')
        render :form, status: :unprocessable_entity
      end
    end

    def edit
      @driver = Driver.find(params[:id])
    end

    def update
      @driver = Driver.find(params[:id])
      @driver.assign_attributes(post_params)
      if @driver.save
        flash.now[:notice] = t('infold.flash.updated')
        render :form
      else
        flash.now[:alert] = t('infold.flash.invalid')
        render :form, status: :unprocessable_entity
      end
    end

    def destroy
      @driver = Driver.find(params[:id])
      if @driver.destroy
        redirect_to admin_drivers_path, status: :see_other, flash: { notice: t('infold.flash.destroyed') }
      else
        flash.now[:alert] = t('flash.invalid_destroy')
        render :show, status: :unprocessable_entity
      end
    end

    private

    def search_params
      params[:search]&.permit(
        :id_eq,
        :sort_field,
        :sort_kind
      )
    end

    def post_params
      params.require(:admin_driver).permit(
        :first_name,
        :last_name,
        :phone,
        :birthday_date,
        :birthday_time
      )
    end
  end
end