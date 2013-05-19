//= require ../vendor/handlebars-1.0.0-rc.3
//= require ../vendor/ember-1.0.0-rc.3
//= require ../vendor/ember-data

BCAuto = Ember.Application.create({
  LOG_TRANSITIONS: true
});

BCAuto.Router.map(function() {
  this.resource('dashboard');
  this.resource('autos');
  this.resource('apps');
  this.resource('users');
  this.resource('registrants');
  this.resource('profile');
});


BCAuto.PhoneNumber = DS.Model.extend({
  nameOfCompany: DS.attr('string'),
  phoneNumber: DS.attr('string'),
  email: DS.attr('string'),
  webSiteUrl: DS.attr('string'),
  city: DS.attr('string'),
  zipCode: DS.attr('string'),
  jobTitle: DS.attr('string'),
  nameOfSupervisor: DS.attr('string'),
  fromMonth: DS.attr('string'),
  fromYear: DS.attr('number'),
  toMonth: DS.attr('string'),
  toYear: DS.attr('number'),
  monthlyPayBeforeTaxes: DS.attr('number')
});


BCAuto.Registrant = DS.Model.extend({
  email: DS.attr('string'),
  code: DS.attr('string'),
  expiresAt: DS.attr('date')
});


BCAuto.Employer = DS.Model.extend({
  nameOfCompany: DS.attr('string'),
  phoneNumber: DS.attr('string'),
  email: DS.attr('string'),
  webSiteUrl: DS.attr('string'),
  city: DS.attr('string'),
  zipCode: DS.attr('string'),
  jobTitle: DS.attr('string'),
  nameOfSupervisor: DS.attr('string'),
  fromMonth: DS.attr('string'),
  fromYear: DS.attr('number'),
  toMonth: DS.attr('string'),
  toYear: DS.attr('number'),
  monthlyPayBeforeTaxes: DS.attr('number')
});

BCAuto.Location = DS.Model.extend({
  addressLineOne: DS.attr('string'),
  addressLineTwo: DS.attr('date'),
  city: DS.attr('string'),
  zipCode: DS.attr('string'),
  fromMonth: DS.attr('string'),
  fromYear: DS.attr('number'),
  toMonth: DS.attr('string'),
  toYear: DS.attr('number'),
  monthlyRentOrMortgate: DS.attr('number'),
  isOwner: DS.attr('boolean')
});

BCAuto.Automobile = DS.Model.extend({
  stockNumber: DS.attr('string'),
  name: DS.attr('string'),
  year: DS.attr('number'),
  make: DS.attr('string'),
  model: DS.attr('string'),
  color: DS.attr('string'),
  style: DS.attr('string'),
  price: DS.attr('number'),
  status: DS.attr('string'),
  doors: DS.attr('number'),
  displacement: DS.attr('number'),
  cylinders: DS.attr('number'),
  mileage: DS.attr('number'),
  carfax: DS.attr('boolean'),
  lowMiles: DS.attr('boolean'),
  fullyServiced: DS.attr('boolean'),
  tiltSteering: DS.attr('boolean'),
  telescopingSteering: DS.attr('boolean'),
  powerSteering: DS.attr('boolean'),
  powerWindows: DS.attr('boolean'),
  powerLocks: DS.attr('boolean'),
  powerMirrors: DS.attr('boolean'),
  powerBrakes: DS.attr('boolean'),
  antilockBrakes: DS.attr('boolean'),
  allWheelDrive: DS.attr('boolean'),
  alloyWheels: DS.attr('boolean'),
  automatic: DS.attr('boolean'),
  cruiseControl: DS.attr('boolean'),
  airConditioning: DS.attr('boolean'),
  autoClimateControl: DS.attr('boolean'),
  dualZone: DS.attr('boolean'),
  am: DS.attr('boolean'),
  fm: DS.attr('boolean'),
  cd: DS.attr('boolean'),
  mp3: DS.attr('boolean'),
  leather: DS.attr('boolean'),
  heatedSeatsFront: DS.attr('boolean'),
  heatedSeatsRear: DS.attr('boolean'),
  roofRack: DS.attr('boolean'),
  runningBoards: DS.attr('boolean'),
  towPackage: DS.attr('boolean'),
  recentBrakes: DS.attr('boolean'),
  recentTires: DS.attr('boolean'),
  recentPaint: DS.attr('boolean'),
  recentTimingBelt: DS.attr('boolean'),
  specialFeatures: DS.attr('string'),
  niceToHave: DS.attr('string'),
  extras: DS.attr('string')
});

BCAuto.CreditApplication = DS.Model.extend({
  driversLicenseNumber: DS.attr('string'),
  dateOfBirth: DS.attr('date'),
  socialSecurityNumber: DS.attr('string'),
  loanAmount: DS.attr('number'),
  salesPerson: DS.attr('string'),
  authorized: DS.attr('boolean'),
  status: DS.attr('string')
});


BCAuto.User = DS.Model.extend({
  stockNumber: DS.attr('string'),
  year: DS.attr('number'),
  make: DS.attr('string'),
  model: DS.attr('string'),
  color: DS.attr('string'),
  style: DS.attr('string'),
  price: DS.attr('number'),
  status: DS.attr('string'),
  name: DS.attr('string')
});