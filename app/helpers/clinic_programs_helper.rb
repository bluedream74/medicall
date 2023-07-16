module ClinicProgramsHelper

  def custom_time_select(f, field, options = {})
    hours = options[:hours] || (0..23)
    interval_minutes = options[:interval_minutes] || 1
    selected = f.object.send(field)
  
    times = hours.flat_map do |hour|
      (0..59).step(interval_minutes).map do |minute|
        time = Time.new(2000, 1, 1, hour, minute)  # any date will suffice
        [time.strftime("%H:%M"), time.strftime("%H:%M"), { selected: selected&.strftime("%H:%M") == time.strftime("%H:%M") }]
      end
    end
  
    f.select(field, times, {}, options)
  end
  
  

end
