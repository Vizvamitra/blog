require 'rails_helper'

RSpec.describe "Articles", type: :request do

  subject{ response }

  shared_examples 'guest-level access' do
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

        it { should have_http_status(:forbidden) }
      end

      context 'when article doesn\'t exist' do
        let(:id){'no_such_article'}

        it { should have_http_status(:not_found) }
      end
    end
  end

  shared_examples 'redirects to login page' do
    it{ should have_http_status(302) }
    it{ should redirect_to new_user_session_path }
  end



  describe 'for guests' do
    before(:each){ request.call }
    include_examples 'guest-level access'

    describe 'GET /articles/new' do
      let(:request){ ->{get new_article_path} }
      it_behaves_like 'redirects to login page'
    end

    describe 'GET /articles/:id/edit' do
      let(:request){ ->{get edit_article_path(create(:article))} }
      it_behaves_like 'redirects to login page'
    end

    describe 'POST /articles' do
      let(:request){ ->{post articles_path} }
      it_behaves_like 'redirects to login page'
    end

    describe 'PATCH /articles/:id' do
      let(:request){ ->{patch article_path(create(:article))} }
      it_behaves_like 'redirects to login page'
    end
  end


  
  describe 'for signed in users' do
    before(:each) do
      @user = create(:user)
      sign_in @user
      request.call
    end

    include_examples 'guest-level access'


    describe 'GET /articles/new' do
      let(:request){ ->{ get new_article_path} }

      it{ should have_http_status(:success) }
      it{ should render_template('articles/new') }
    end


    describe 'POST /articles' do
      let(:request){ ->{post articles_path, article: params} }

      context 'when article params are valid' do
        let(:params){attributes_for(:article).except(:author)}
        let(:article){ Article.last }

        it{ should redirect_to(article_path(article)) }

        it 'creates a new article' do
          params.each{ |k,v| expect(article[k]).to eq v }
        end
      end

      context 'when article params are invalid' do
        let(:params){ attributes_for(:invalid_article) }

        it{ should render_template('articles/new') }
      end
    end


    describe 'GET /articles/:id/edit' do
      let(:request){ ->{ get edit_article_path(article)} }

      context 'if article\'s author is current user' do
        let(:article){ create(:article, author: @user.id) }

        it{ should have_http_status(:success) }
        it{ should render_template('articles/edit') }
      end

      context 'if article\'s author is another user' do
        let(:article){ create(:article) }

        it{ should have_http_status(403) }
      end
    end


    describe 'PATCH /articles/:id' do
      let(:request){ ->{patch article_path(article), article: params} }

      context 'if articles\'s author is current user' do
        let(:article){ create(:article, author: @user.id) }

        context 'when article params are valid' do
          let(:params){attributes_for(:article).except(:author)}

          it{ should redirect_to(article_path(article)) }

          it 'updates article' do
            article.reload
            params.each{ |k,v| expect(article[k]).to eq v }
          end
        end

        context 'when article params are invalid' do
          let(:params){ attributes_for(:invalid_article) }

          it{ should render_template('articles/edit') }
        end
      end

      context 'if article\'s author is another user' do
        let(:article){ create(:article) }
        let(:params){attributes_for(:article).except(:author)}

        it{ should have_http_status(403) }
      end
    end

  end
end