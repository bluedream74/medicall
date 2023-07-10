module SchedulesHelper
  def schedule_matrix(schedules)
    matrix = {}
    
    schedules.each do |schedule|
      key = "#{schedule.start_time.strftime('%H:%M')}〜#{schedule.end_time.strftime('%H:%M')}"
      matrix[key] ||= {}
      matrix[key][schedule.day_of_week] = true
    end
    
    matrix
  end
end
