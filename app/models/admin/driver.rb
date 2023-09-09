module Admin
  class Driver < ::Driver
    include DatetimeFieldConcern

    datetime_field :birthday

    validates :birthday_date, presence: true, if: -> { birthday_time.present? }
    validates :birthday_time, presence: true, if: -> { birthday_date.present? }

    scope :id_eq, ->(v) do
      where(id: v) if v.present?
    end


  end
end
