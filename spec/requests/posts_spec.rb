require 'rails_helper'

RSpec.describe "Posts", type: :request do
  
  describe 'GET /posts' do
    before(:each){ get posts_path }
    subject{ response }

    it{ should have_http_status(:success) }
    it{ should render_template('posts/index') }
  end

  describe 'GET /posts/:id' do
    let(:published_post){ create(:post, :published) }
    let(:planned_post){ create(:post, :planned) }
    let(:expired_post){ create(:post, :expired) }
    let(:draft_post){ create(:post, :draft) }
    let(:not_published_posts){ [planned_post, expired_post, draft_post] }

    let(:request){ ->(id){ get post_path(id)} }
    before(:each){ request.call(id) }
    subject{ response }

    context 'when post is published' do
      let(:id){published_post.id}

      it { should have_http_status(:success) }
      it { should render_template('posts/show') }
    end

    context 'when post is not published' do
      let(:id){not_published_posts.sample.id}

      it { should have_http_status(:not_found) }
    end

    context 'when post doesn\'t exist' do
      let(:id){'no_such_post'}

      it { should have_http_status(:not_found) }
    end
  end

end