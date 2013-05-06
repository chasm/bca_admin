attributes  :id, :air_conditioning, :all_wheel_drive, :alloy_wheels,
            :am, :antilock_brakes, :auto_climate_control, :automatic, :carfax,
            :cd, :color, :cruise_control, :cylinders, :displacement, :doors, :dual_zone,
            :extras, :fm, :fully_serviced, :heated_seats_front, :heated_seats_rear,
            :leather, :low_miles, :make, :mileage, :model, :mp3, :name, :nice_to_have,
            :power_brakes, :power_locks, :power_mirrors, :power_steering,
            :power_windows, :price, :recent_brakes, :recent_paint,
            :recent_timing_belt, :recent_tires, :roof_rack, :running_boards,
            :special_features, :status, :stock_number, :style, :telescoping_steering,
            :tilt_steering, :tow_package, :year, :credit_applications

child :photos do
  attributes :id
end

child :credit_applications do
  attributes :id, :user, :status
  
  child :user do
    attributes :name
  end
end
