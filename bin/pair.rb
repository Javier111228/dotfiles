#!/usr/bin/env ruby

schedule = {
  monday: [],
  tuesday: [],
  wednesday: [],
  thursday: [],
  friday: []
}

def make_pairs(day, all_pax, schedule)
  if all_pax.size > 1
    pax = all_pax
    p1 = pax.first
    pax = pax.drop(1)
    p2 = pax.shuffle!.first
    schedule[day] << [p1, p2]
    make_pairs(day, pax.drop(1), schedule)
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
  make_pairs(day, pax, schedule)
end

schedule.each do |day, pairs|
  puts day.capitalize.to_s + ':' unless pairs.empty?
  pairs.each_with_index do |pair, i|
    puts "   Room #{i}: #{pair.first.capitalize} & #{pair.last.capitalize}"
  end
  puts ''
end
