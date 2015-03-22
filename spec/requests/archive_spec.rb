require 'rails_helper'

RSpec.describe "Archive", type: :request do

  subject{ response }
  before(:each){ request.call }


  describe 'GET /archive' do
    let(:request){ ->{get archive_path} }

    it{ should have_http_status(:success) }
    it{ should render_template('archive/show') }
  end
  
end