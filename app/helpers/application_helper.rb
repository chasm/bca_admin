module ApplicationHelper
  def convert_to_text(bln)
    if bln.nil?
      content_tag('span', 'N/A', :class => 'n_a')
    elsif bln
      content_tag('span', 'Yes', :class => 'yes')
    else
      content_tag('span', 'No', :class => 'no')
    end
  end
  
  def load_uuids
    (1..25).to_a.map do |i|
      SecureRandom.uuid
    end
  end
end
