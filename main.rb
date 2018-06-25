require './search'
require './parse'
require './open_file'
require 'pry'

name_of_file = "data.json"

file = OpenFile.new(name_of_file).call #open file

parsed = Parse.new(file).call #parsed json file

text = 'ColdFusion' #find by this text

result = Search.new(parsed, text).call #show results
