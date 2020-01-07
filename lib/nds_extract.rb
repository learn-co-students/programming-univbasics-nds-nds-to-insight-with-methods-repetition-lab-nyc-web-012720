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

def list_of_directors(source)
  # Write this implementation
  array = []
  count = 0
  while count < source.length
    name = source[count][:name]
    array << name
    count += 1
  end
  array
end

def total_gross(source)

  directors = directors_totals(source)
  directors_list = list_of_directors(source)

  grand_total = 0
  count = 0
  while count < directors.length
    director_being_added_to_count = directors_list[count]
    total_for_director = directors[director_being_added_to_count]
    grand_total += total_for_director
    count += 1
  end
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  return grand_total
end
