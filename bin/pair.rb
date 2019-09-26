#!/usr/bin/env ruby

monday = %i[brenda caesar erin rebecca shelia]
tuesday = %i[brenda caesar erin johnny rebecca shelia]
wednesday = %i[erin rebecca]
thursday = %i[brenda erin johnny rebecca shelia]
friday = %i[]

class PairingScheduleFactory
  def initialize(monday:, tuesday:, wednesday:, thursday:, friday:)
    @availabilities = {
      monday: monday,
      tuesday: tuesday,
      wednesday: wednesday,
      thursday: thursday,
      friday: friday
    }
    @schedule = {
      monday: [],
      tuesday: [],
      wednesday: [],
      thursday: [],
      friday: []
    }
    @pairs = []
  end

  def build
    availabilities.each do |day, pax|
      make_pairs(day, pax)
    end
    pretty_print
  end

  private

  attr_accessor :availabilities, :schedule, :pairs

  def make_pairs(day, pax)
    if pax.size > 1
      pair = make_unique_pair(pax)
      schedule[day] << pair
      make_pairs(day, pax - pair)
    end
  end

  def make_unique_pair(pax)
    attempt_to_make_unique_pair(pax, 3)
  end

  def attempt_to_make_unique_pair(pax, attemps_left)
    pair = make_pair(pax)
    if attemps_left.positive? && pairs.include?(pair)
      attempt_to_make_unique_pair(pax, attemps_left - 1)
    else
      pairs << pair
      pair
    end
  end

  def make_pair(pax)
    p1 = pax.sample
    p2 = (pax - [p1]).sample
    [p1, p2].sort
  end

  def pretty_print
    schedule.each do |day, day_pairs|
      unless day_pairs.empty?
        puts day.capitalize.to_s + ':'
        day_pairs.each_with_index do |pair, i|
          puts "    Room #{i}: #{pair.first.capitalize} & #{pair.last.capitalize}"
        end
        puts ''
      end
    end
  end
end

PairingScheduleFactory.new(
  monday: monday,
  tuesday: tuesday,
  wednesday: wednesday,
  thursday: thursday,
  friday: friday
).build
