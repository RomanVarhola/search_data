require './helper'

class Search
  attr_reader :data, :text

  include Helper

  def initialize(data, text)
    @data = data
    @text = text
  end
  
  def call
    result
  end

  def result
    result = []
    data.each do |t|
      result.push(t) if matched_text(t)
    end
    result
  end

  def matched_text(t)
    true if condition(t)
  end

  def matched_field(field, t, method_name)
    flag = false
    flag = true if matched(field, text)
    flag = first_check_multi_words(field) if flag == false
    flag = second_check_multi_words(field, t) if flag == false
    flag
  end

  def splitted_text
    text.split(' ')
  end

  private

  def first_check_multi_words(field)
    flag = false
    count = 0
    splitted_text.each {|st| count += 1 if matched(field, st) }
    flag = true if count == splitted_text.count
    flag
  end

  def second_check_multi_words(field, t)
    flag = false
    count = 0
    splitted_text.each {|st| count += 1 if matched(type(t), st) || matched(designed_by(t), st) }
    flag = true if count == splitted_text.count
    flag
  end

  def matched(field, t)
    field.match( /\b#{t}\b/i )
  end

  def condition(t)
    matched_field(name(t), t, 'name') || 
    matched_field(type(t), t, 'type') || 
    matched_field(designed_by(t), t, 'designed_by')
  end
end
