class OpenFile
  attr_reader :name_of_file

  def initialize(name_of_file)
    @name_of_file = name_of_file
  end
  
  def call
    file.read
  end

  def file 
    @file ||= open(name_of_file)
  end
end
