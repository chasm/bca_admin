@BridgeCity.start(
  currentUser: gon.current_user
  environment: gon.environment
  autoStatuses: gon.auto_statuses
  autoStyles: gon.auto_styles
  creditAppStatuses: gon.credit_app_statuses
)

@BridgeCity.Utils.addIds gon.uuids
