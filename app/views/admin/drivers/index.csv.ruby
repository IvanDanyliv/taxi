require 'csv'

CSV.generate do |csv|
  # set title row
  csv << [
    Admin::Driver.human_attribute_name(:id),
    Admin::Driver.human_attribute_name(:first_name),
    Admin::Driver.human_attribute_name(:last_name),
    Admin::Driver.human_attribute_name(:phone),
    Admin::Driver.human_attribute_name(:birthday),
    Admin::Driver.human_attribute_name(:created_at),
    Admin::Driver.human_attribute_name(:updated_at),
  ]
  # set body rows
  @drivers.each do |driver|
    csv << [
      driver.id,
      driver.first_name,
      driver.last_name,
      driver.phone,
      driver.birthday,
      driver.created_at,
      driver.updated_at,
    ]
  end
end