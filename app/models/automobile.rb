class Automobile
  include Mongoid::Document
  include Mongoid::Timestamps
  
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
  
  field :_id, String, :required => true
  field :stock_number, String, :required => true, :unique => true
  field :make, String, :required => true
  field :model, String, :required => true
  field :year, Integer, :required => true, :numeric => true
  field :color, String, :required => true
  field :style, String, :required => true, :in => self.styles
  field :price, Integer, :required => true, :numeric => true
  field :doors, Integer
  field :displacement, Float
  field :cylinders, Integer
  field :mileage, Float
  field :carfax, Boolean
  field :low_miles, Boolean
  field :fully_serviced, Boolean
  field :tilt_steering, Boolean
  field :telescoping_steering, Boolean
  field :power_steering, Boolean
  field :power_windows, Boolean
  field :power_locks, Boolean
  field :power_mirrors, Boolean
  field :power_brakes, Boolean
  field :antilock_brakes, Boolean
  field :all_wheel_drive, Boolean
  field :alloy_wheels, Boolean
  field :automatic, Boolean
  field :cruise_control, Boolean
  field :air_conditioning, Boolean
  field :auto_climate_control, Boolean
  field :dual_zone, Boolean
  field :am, Boolean
  field :fm, Boolean
  field :cd, Boolean
  field :mp3, Boolean
  field :leather, Boolean
  field :heated_seats_front, Boolean
  field :heated_seats_rear, Boolean
  field :roof_rack, Boolean
  field :running_boards, Boolean
  field :tow_package, Boolean
  field :recent_brakes, Boolean
  field :recent_tires, Boolean
  field :recent_paint, Boolean
  field :recent_timing_belt, Boolean
  field :special_features, String
  field :nice_to_have, String
  field :extras, String
  field :status, String, :in => self.statuses, :required => true, :default => self.statuses.first
  
  # many :photos
  # many :credit_applications
  # many :registrants
  
  def name
    [self.year, self.make, self.model].compact.join(" ")
  end
end
