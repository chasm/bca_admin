class Automobile
  include MongoMapper::Document
  
  def self.styles
    [
      "sedan",
      "sports car",
      "hatchback",
      "sports utility vehicle",
      "minivan",
      "microcar",
      "station wagon",
      "van",
      "recreational vehicle",
      "limousine",
      "other"
    ]
  end
  
  def self.statuses
    ['available', 'pending', 'sold']
  end
  
  attr_accessible :_id, :air_conditioning, :all_wheel_drive, :alloy_wheels,
    :am, :antilock_brakes, :auto_climate_control, :automatic, :carfax,
    :cd, :color, :cruise_control, :cylinders, :displacement, :doors, :dual_zone,
    :extras, :fm, :fully_serviced, :heated_seats_front, :heated_seats_rear,
    :leather, :low_miles, :make, :mileage, :model, :mp3, :nice_to_have,
    :power_brakes, :power_locks, :power_mirrors, :power_steering,
    :power_windows, :price, :recent_brakes, :recent_paint,
    :recent_timing_belt, :recent_tires, :roof_rack, :running_boards,
    :special_features, :status, :stock_number, :style, :telescoping_steering,
    :tilt_steering, :tow_package, :year, :credit_applications
  
  key :_id, String, :required => true
  key :stock_number, String, :required => true, :unique => true
  key :make, String, :required => true
  key :model, String, :required => true
  key :year, Integer, :required => true, :numeric => true
  key :color, String, :required => true
  key :style, String, :required => true, :in => self.styles
  key :price, Integer, :required => true, :numeric => true
  key :doors, Integer
  key :displacement, Float
  key :cylinders, Integer
  key :mileage, Float
  key :carfax, Boolean
  key :low_miles, Boolean
  key :fully_serviced, Boolean
  key :tilt_steering, Boolean
  key :telescoping_steering, Boolean
  key :power_steering, Boolean
  key :power_windows, Boolean
  key :power_locks, Boolean
  key :power_mirrors, Boolean
  key :power_brakes, Boolean
  key :antilock_brakes, Boolean
  key :all_wheel_drive, Boolean
  key :alloy_wheels, Boolean
  key :automatic, Boolean
  key :cruise_control, Boolean
  key :air_conditioning, Boolean
  key :auto_climate_control, Boolean
  key :dual_zone, Boolean
  key :am, Boolean
  key :fm, Boolean
  key :cd, Boolean
  key :mp3, Boolean
  key :leather, Boolean
  key :heated_seats_front, Boolean
  key :heated_seats_rear, Boolean
  key :roof_rack, Boolean
  key :running_boards, Boolean
  key :tow_package, Boolean
  key :recent_brakes, Boolean
  key :recent_tires, Boolean
  key :recent_paint, Boolean
  key :recent_timing_belt, Boolean
  key :special_features, String
  key :nice_to_have, String
  key :extras, String
  key :status, String, :in => self.statuses, :required => true, :default => self.statuses.first
  
  timestamps!
  
  many :photos
  many :credit_applications
  many :registrants
  
  scope :available, where(:status => 'available')
  scope :pending, where(:status => 'pending')
  scope :sold, where(:status => 'sold')
  
  def name
    [self.year, self.make, self.model].compact.join(" ")
  end
end
