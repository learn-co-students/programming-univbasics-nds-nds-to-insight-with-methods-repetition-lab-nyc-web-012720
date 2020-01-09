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
  result = []
  row_index = 0
  while row_index < source.length do
    result.push(source[row_index][:name])
    row_index += 1
  end
  return result
end

def total_gross(source)
  
  directors_totals = directors_totals(source)
  dir = list_of_directors(source) 
  total = 0
  index = 0
  while index < dir.length do
    total += directors_totals[dir[index]]
    index += 1
  end
  return total
end


