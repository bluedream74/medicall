module ClinicProgramsHelper

  def custom_time_select(form, field, options = {})
    hours = options[:hours] || (0..23)
    minutes = options[:minutes] || (0..59).step(options[:interval_minutes] || 1).to_a
  
    time_options = hours.map do |hour|
      minutes.map do |minute|
        time = Time.new(2000, 01, 01, hour, minute)
        ["#{time.strftime('%H:%M')}", time.strftime('%H:%M')]
      end
    end.flatten(1)
  
    default_time = options[:default] ? options[:default][:hour] + ':' + options[:default][:minute] : nil
    form.select field, time_options, {selected: default_time}, {class: options[:class]}
  end  
  

end
