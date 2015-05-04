require 'rails_helper'

RSpec.describe Snippets::Text, :type => :model do

  let(:factory){ :text_snippet }

  describe 'validations' do
    it{ should validate_presence_of(:body) }
  end

end