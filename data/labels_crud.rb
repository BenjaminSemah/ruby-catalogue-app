def populate_labels
    fetch_data('labels').map do |label|
      Label.new(label['name'], label['color'])
      Label.new(label['title'], label['color'])
    end
  end
  