require 'rails_helper'

RSpec.describe TagAggregator, type: :service do
  
  describe ':run' do
    before(:each) do
      create(:article, :published, tags: ['test', 'spec', 'feature'])
      create(:article, :published, tags: ['test', 'cucumber'])
      Tag.delete_all
    end

    it 'creates unique tags' do
      expect{TagAggregator.run}.to change(Tag, :count).by(4)
      expect(Tag.all.map(&:name)).to match_array ['test', 'spec', 'feature', 'cucumber']
    end

    it 'calculates tag count' do
      TagAggregator.run
      expect(Tag.find('test').count).to eq 2
      expect(Tag.find('spec').count).to eq 1
    end
  end

end