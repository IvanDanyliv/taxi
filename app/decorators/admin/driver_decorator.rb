module Admin
  module DriverDecorator
    def birthday_display
      birthday ? I18n.l(birthday) : ''
    end

    def created_at_display
      created_at ? I18n.l(created_at) : ''
    end

    def updated_at_display
      updated_at ? I18n.l(updated_at) : ''
    end

  end
end