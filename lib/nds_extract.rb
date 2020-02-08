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
  directors_names = []
  counter = 0
  while counter < source.length do
    directors_names.push(source[counter][:name])
    counter += 1
  end
  directors_names
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  
  # grand_total = 0
  # counter = 0
  # hash_to_use = directors_totals(source)
  # while counter < hash_to_use.length do 
    
  #   array = list_of_directors(source)
  #   inner_counter = 0
  #   while inner_counter < array.length do
      
  #     key = array[inner_counter]
  #     grand_total += hash_to_use[key]
  #     inner_counter += 1
  #     counter += 1
    
  #   end
          
  # end
  # grand_total

  grand_total = 0
  hash = directors_totals(source)
  array = list_of_directors(source)
  counter = 0
  
  while counter < hash.length do 
    key = array[counter]
    grand_total += hash[key]
    counter += 1  
  end
  grand_total
end
