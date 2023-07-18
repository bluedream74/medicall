class ClinicProgram < ApplicationRecord
  belongs_to :clinic

  bitmask :weekdays, as: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  def self.weekdays
    {
      monday: "月",
      tuesday: "火",
      wednesday: "水",
      thursday: "木",
      friday: "金",
      saturday: "土",
      sunday: "日",
    }
  end

  def weekdays_as_bitfield=(days)
    self.weekdays = days.reduce(0) do |bitfield, day|
      bitfield | (1 << ClinicProgram.weekdays[day])
    end
  end
end
