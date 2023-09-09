module Admin
  class DriverSearchForm < BaseSearchForm

    set_condition :id_eq

    def perform(page = nil, limit: nil, csv: false)
      records = Driver.distinct
      records = apply_conditions(records, page, limit, csv)
      apply_sort(records, Driver.primary_key)
    end
  end
end