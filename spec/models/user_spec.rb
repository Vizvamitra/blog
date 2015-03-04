require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'validations' do
    include_examples 'validates presence of', :name
    include_examples 'validates uniqueness of', :name
  end

end
