$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0
  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source) #[{:name=>"Larry"}, {:name=>"Curly"}, {:name=>"Moe"}, {:name=>"Iggy"}]
  # Write this implementation
  pp source
  list = []
  director_index = 0
  while director_index < source.length do
    list << source[director_index][:name]
    director_index += 1
  end
  list
end

def total_gross(source)

  # Write this implementation

  director_earnings_hash = directors_totals(source)
  list = list_of_directors(source) #creates a variable for array printed by list_of_directors
  director_index = 0
  grand_total = 0
  while director_index < list.length do
    name = list[director_index]
    grand_total += director_earnings_hash[name] #this is a hash, how do we access each worldwide_gross to add to grand total?
    director_index += 1
  end
  grand_total
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end
