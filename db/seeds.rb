Registrant.destroy_all
Automobile.destroy_all
CreditApplication.destroy_all
User.destroy_all

autos = Automobile.create([
  {
    _id: SecureRandom.uuid,
    year: 1977,
    make: 'Chevy',
    model: 'Monte Carlo',
    stock_number: 'AN774X330C',
    color: 'Metallic Blue',
    price: 6000,
    style: 'sedan',
    doors: 2,
    displacement: 4.6,
    cylinders: 8,
    mileage: 26000.7,
    carfax: false,
    low_miles: true,
    fully_serviced: true,
    tilt_steering: true,
    telescoping_steering: false,
    power_steering: true,
    power_windows: true,
    power_locks: false,
    power_mirrors: false,
    power_brakes: true,
    antilock_brakes: false,
    all_wheel_drive: false,
    alloy_wheels: true,
    automatic: true,
    cruise_control: true,
    air_conditioning: true,
    auto_climate_control: false,
    dual_zone: false,
    am: true,
    fm: true,
    cd: false,
    mp3: false,
    leather: true,
    heated_seats_front: false,
    heated_seats_rear: false,
    roof_rack: false,
    running_boards: false,
    tow_package: false,
    recent_brakes: true,
    recent_tires: true,
    recent_paint: true,
    recent_timing_belt: true,
    status: 'available'
  },
  {
    _id: SecureRandom.uuid,
    year: 1986,
    make: 'Pontiac',
    model: 'Firebird',
    stock_number: 'ST813X442D',
    color: 'Fire Engine Red',
    price: 26000,
    style: 'sports car',
    doors: 2,
    status: 'available'
  },
  {
    _id: SecureRandom.uuid,
    year: 1970,
    make: 'Pontiac',
    model: 'Firebird',
    stock_number: 'ER145X217F',
    color: 'Primer Gray and Black',
    price: 500,
    style: 'sports car',
    doors: 2,
    status: 'pending'
  }
])

user = User.create :_id => SecureRandom.uuid,
  :name_first            => 'Charles',
  :name_mi               => 'F.',
  :name_last             => 'Munat',
  :email_address         => 'chas@munat.com',
  :is_admin              => true,
  :password              => '123',
  :password_confirmation => '123',
  :phone_numbers         => [
    {
      :_id          => SecureRandom.uuid,
      :phone_number => '2069253872',
      :phone_type   => 'voip'
    },
    { 
      :_id          => SecureRandom.uuid,
      :phone_number => '2068424896',
      :phone_type   => 'home'
    }
  ]

CreditApplication.create :_id => SecureRandom.uuid,
  :drivers_license_number => 'DL410D7MUNA',
  :date_of_birth          => Date.new(1959,3,27),
  :social_security_number => '328548012',
  :loan_amount            => 14105.0,
  :sales_person           => 'Sam Stone',
  :authorized             => true,
  :status                 => 'new',
  :locations => [
    {
      :_id                      => SecureRandom.uuid,
      :address_line_one         => '5408 Meridian Ave. N. #204',
      :city                     => 'Seattle',
      :zip_code                 => '98103',
      :from_month               => 'September',
      :from_year                => 2004,
      :to_month                 => 'November',
      :to_year                  => 2009,
      :monthly_rent_or_mortgage => 1190.0,
      :is_owner                 => false
    },
    {
      :_id                      => SecureRandom.uuid,
      :address_line_one         => '5202 S. Dorchester #2A',
      :city                     => 'Chicago',
      :zip_code                 => '60615',
      :from_month               => 'May',
      :from_year                => 1962,
      :to_month                 => 'December',
      :to_year                  => 1968,
      :monthly_rent_or_mortgage => 150.0,
      :is_owner                 => false
    }
  ],
  :employers => [
    {
      :_id                      => SecureRandom.uuid,
      :name_of_company          => 'Gunderson, Inc.',
      :phone_number             => '5035551212',
      :email_address            => 'info@gundersoninc.com',
      :web_site_url             => 'gundersoninc.com',
      :city                     => 'Portland',
      :zip_code                 => '97211',
      :job_title                => 'Training Supervisor',
      :from_month               => 'July',
      :from_year                => 1990,
      :to_month                 => 'July',
      :to_year                  => 1997,
      :monthly_pay_before_taxes => 3500.0
    },
    {
      :_id                      => SecureRandom.uuid,
      :name_of_company          => 'University of Washington',
      :phone_number             => '20965551212',
      :email_address            => 'info@uw.edu',
      :web_site_url             => 'uw.edu',
      :city                     => 'Seattle',
      :zip_code                 => '98105',
      :job_title                => 'Senior Programmer',
      :from_month               => 'July',
      :from_year                => 2004,
      :to_month                 => 'July',
      :to_year                  => 2009,
      :monthly_pay_before_taxes => 3800.0
    },
  ],
  :user => user