#!/usr/bin/env ruby

schedule = {
  monday: [],
  tuesday: [],
  wednesday: [],
  thursday: [],
  friday: []
}

pairs = []

def make_pair(pax)
  p1 = pax.sample
  p2 = (pax - [p1]).sample
  [p1, p2].sort
end

def attempt_to_make_unique_pair(pax, pairs, attemps_left)
  pair = make_pair(pax)
  if attemps_left.positive? && pairs.include?(pair)
    attempt_to_make_unique_pair(pax, pairs, attemps_left - 1)
  else
    pairs << pair
    pair
  end
end

def make_unique_pair(pax, pairs)
  attempt_to_make_unique_pair(pax, pairs, 3)
end

def make_pairs(day, pax, schedule, pairs)
  if pax.size > 1
    pair = make_unique_pair(pax, pairs)
    schedule[day] << pair
    make_pairs(day, pax - pair, schedule, pairs)
  end
end

availabilities = {
  monday: %i[caesar shelia erin rebecca],
  tuesday: %i[johnny caesar shelia erin rebecca],
  wednesday: %i[erin rebecca],
  thursday: %i[johnny rebecca shelia brenda],
  friday: %i[]
}

availabilities.each do |day, pax|
  make_pairs(day, pax, schedule, pairs)
end

schedule.each do |day, pairs|
  puts day.capitalize.to_s + ':' unless pairs.empty?
  pairs.each_with_index do |pair, i|
    puts "   Room #{i}: #{pair.first.capitalize} & #{pair.last.capitalize}"
  end
  puts ''
end
