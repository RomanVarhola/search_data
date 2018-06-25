require 'json'

class Parse
  attr_reader :json

  def initialize(json)
    @json = json
  end
  
  def call
    JSON.parse(json)
  end
end
