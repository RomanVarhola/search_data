require 'spec_helper'

RSpec.describe Search, type: :model do
  
  context 'search element by text' do
    name_of_file = "data.json"
    file = OpenFile.new(name_of_file).call
    parsed = Parse.new(file).call

    it 'word "AP"' do
      text = 'AP'
      results = Search.new(parsed, text).call
      expect(results.count).to eq(0)
    end

    it 'word "K"' do
      text = 'K'
      results = Search.new(parsed, text).call
      expect(results.count).to eq(1)
    end

    it 'word "ColdFusion"' do
      text = 'ColdFusion'
      results = Search.new(parsed, text).call
      expect(results.count).to eq(1)
    end

    it 'word "Lisp Common"' do
      text = 'Lisp Common'
      results = Search.new(parsed, text).call
      expect(results.count).to eq(1)
    end

    it 'word "Thomas Eugene"' do
      text = 'Thomas Eugene'
      results = Search.new(parsed, text).call
      expect(results.count).to eq(1)
    end

    it 'word "Yukihiro Matsumoto"' do
      text = 'Yukihiro Matsumoto'
      results = Search.new(parsed, text).call
      expect(results.count).to eq(1)
    end

    it 'word "Scripting Microsoft"' do
      text = 'Scripting Microsoft'
      results = Search.new(parsed, text).call
      expect(results.count).to eq(3)
    end
  end
end
