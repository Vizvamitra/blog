require 'rails_helper'

RSpec.describe "Posts", type: :request do
  
  describe 'GET /posts' do
    before(:each){ get posts_path }
    subject{ response }

    it{ should have_http_status(:success) }
    it{ should render_template('posts/index') }
  end

end