require 'rails_helper'

RSpec.describe "Articles", type: :request do

  subject{ response }
  before(:each){ request.call }

  describe 'GET /articles' do
    let(:request){ ->{get articles_path} }

    it{ should have_http_status(:success) }
    it{ should render_template('articles/index') }
  end

  describe 'GET /articles/:id' do
    let(:published_article){ create(:article, :published) }
    let(:not_published_article){create(:article, [:planned, :expired, :draft].sample)}

    let(:request){ ->{ get article_path(id)} }

    context 'when article is published' do
      let(:id){published_article.id}

      it { should have_http_status(:success) }
      it { should render_template('articles/show') }
    end

    context 'when article is not published' do
      let(:id){not_published_article}

      it { should have_http_status(:not_found) }
    end

    context 'when article doesn\'t exist' do
      let(:id){'no_such_article'}

      it { should have_http_status(:not_found) }
    end
  end
  
end