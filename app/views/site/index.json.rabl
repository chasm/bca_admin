object false

node do
  {
    environment: Rails.env,
    uuids: get_uuids(25),
    auto_statuses: Automobile.statuses,
    auto_styles: Automobile.styles,
    credit_app_statuses: CreditApplication.statuses
  }
end