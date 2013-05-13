class Automobile
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embeds_many :photos
  
  has_many :credit_applications
  has_many :registrants
  
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
  
  def self.min_price
    1000
  end
  
  def self.max_price
    100_000
  end
  
  def self.first_year
    1920
  end
  
  def self.next_year
    Date.today.year + 1
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
  
  field :_id, type: String
  field :stock_number, type: String
  field :year, type: Integer
  field :make, type: String
  field :model, type: String
  field :color, type: String
  field :style, type: String
  field :price, type: Integer
  field :status, type: String, default: self.statuses.first
  
  field :doors, type: Integer
  field :displacement, type: Float
  field :cylinders, type: Integer
  field :mileage, type: Float
  
  field :carfax, type: Boolean
  field :low_miles, type: Boolean
  field :fully_serviced, type: Boolean
  field :tilt_steering, type: Boolean
  field :telescoping_steering, type: Boolean
  field :power_steering, type: Boolean
  field :power_windows, type: Boolean
  field :power_locks, type: Boolean
  field :power_mirrors, type: Boolean
  field :power_brakes, type: Boolean
  field :antilock_brakes, type: Boolean
  field :all_wheel_drive, type: Boolean
  field :alloy_wheels, type: Boolean
  field :automatic, type: Boolean
  field :cruise_control, type: Boolean
  field :air_conditioning, type: Boolean
  field :auto_climate_control, type: Boolean
  field :dual_zone, type: Boolean
  field :am, type: Boolean
  field :fm, type: Boolean
  field :cd, type: Boolean
  field :mp3, type: Boolean
  field :leather, type: Boolean
  field :heated_seats_front, type: Boolean
  field :heated_seats_rear, type: Boolean
  field :roof_rack, type: Boolean
  field :running_boards, type: Boolean
  field :tow_package, type: Boolean
  field :recent_brakes, type: Boolean
  field :recent_tires, type: Boolean
  field :recent_paint, type: Boolean
  field :recent_timing_belt, type: Boolean
  
  field :special_features, type: String
  field :nice_to_have, type: String
  field :extras, type: String
  
  validates :stock_number,  presence: true, uniqueness: true
  validates :year,          presence: true,
                            numericality: {
                              greater_than_or_equal_to: self.first_year,
                              less_than_or_equal_to: self.next_year,
                              only_integer: true
                            }
  validates :make,          presence: true
  validates :model,         presence: true
  validates :color,         presence: true
  validates :style,         presence: true, inclusion: { in: self.styles }
  validates :price,         presence: true,
                            numericality: {
                              greater_than_or_equal_to: self.min_price,
                              less_than_or_equal_to: self.max_price,
                              only_integer: true
                            }
  validates :status,        presence: true, inclusion: { in: self.statuses }
  validates :photos,        associated: true # need example in spec
  
  def name
    [self.year, self.make, self.model].compact.join(" ")
  end
end
