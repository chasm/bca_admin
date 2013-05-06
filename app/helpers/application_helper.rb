module ApplicationHelper
  def load_uuids
    (1..25).to_a.map do |i|
      SecureRandom.uuid
    end
  end
end
