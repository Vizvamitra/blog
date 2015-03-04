require 'rails_helper'

RSpec.describe Post, :type => :model do

  describe 'validations' do
    include_examples 'validates presence of', :title, :body
  end

end
