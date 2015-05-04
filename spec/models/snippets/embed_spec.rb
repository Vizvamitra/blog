require 'rails_helper'

RSpec.describe Snippets::Embed, :type => :model do

  let(:factory){ :embed_snippet }

  describe 'validations' do
    it{ should validate_presence_of(:body) }
  end

end