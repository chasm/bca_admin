BridgeCity.PhoneNumberView = Marionette.ItemView.extend({
  tagName: '<li>',
  className: 'phone-number',
  template: BridgeCity.templ_phone_number
});

BridgeCity.CreditApplicationView = Marionette.ItemView.extend({
  tagName: '<li>',
  className: 'credit-application',
  template: BridgeCity.templ_credit_application
});

BridgeCity.UserRowView = Marionette.ItemView.extend({
  tagName: '<tr>',
  className: 'user',
  template: BridgeCity.templ_user_row
});

BridgeCity.UserListView = Marionette.CollectionView.extend({
  el: '#insert_view_here',
  template: BridgeCity.templ_user_list,
  itemView: BridgeCity.UserRowView,
  events: {}
});

BridgeCity.UserDetailView = Marionette.ItemView.extend({
  el: '#insert_view_here'
});

BridgeCity.UserFormView = Marionette.ItemView.extend({
  el: '#insert_view_here'
});