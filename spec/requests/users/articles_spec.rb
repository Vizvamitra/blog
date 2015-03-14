require 'rails_helper'

RSpec.describe 'CurrentUser/Articles' do
  
  shared_examples 'redirects to login page' do
    it{ should have_http_status(302) }
    it{ should redirect_to new_user_session_path }
  end

  subject{ response }

  describe 'for guest' do
    before(:each){ request.call }

    describe 'GET index' do
      let(:request){ ->{get current_user_articles_path} }
      it_behaves_like 'redirects to login page'
    end

    describe 'GET show' do
      let(:request){ ->{get current_user_article_path(create(:article))} }
      it_behaves_like 'redirects to login page'
    end

     describe 'GET /users/current/articles/new' do
      let(:request){ ->{get new_current_user_article_path} }
      it_behaves_like 'redirects to login page'
    end

    describe 'GET /users/current/articles/:id/edit' do
      let(:request){ ->{get edit_current_user_article_path(create(:article))} }
      it_behaves_like 'redirects to login page'
    end

    describe 'POST /users/current/articles' do
      let(:request){ ->{post current_user_articles_path} }
      it_behaves_like 'redirects to login page'
    end

    describe 'PATCH /users/current/articles/:id' do
      let(:request){ ->{patch current_user_article_path(create(:article))} }
      it_behaves_like 'redirects to login page'
    end

    describe 'DELETE /users/current/articles/:id' do
      let(:request){ ->{delete current_user_article_path(create(:article))} }
      it_behaves_like 'redirects to login page'
    end
  end



  describe 'for signed in users' do
    before(:each) do
      @user = create(:user)
      sign_in @user
      request.call
    end

    
    describe 'GET /users/current/articles' do
      let(:request){ ->{get current_user_articles_path} }

      it{ should have_http_status(:success) }
      it{ should render_template(:index) }
    end


    describe 'GET /users/current/articles/:id' do
      let(:request){ ->{ get current_user_article_path(id)} }
      
      context 'when article existsd' do
        let(:id){ create(:article, author: @user).id }

        it { should have_http_status(:success) }
        it { should render_template('current_user/articles/show') }
      end

      context 'when article doesn\'t exist' do
        let(:id){'no_such_article'}

        it { should have_http_status(:not_found) }
      end
    end


    describe 'GET /users/current/articles/new' do
      let(:request){ ->{ get new_current_user_article_path} }

      it{ should have_http_status(:success) }
      it{ should render_template('current_user/articles/new') }
    end


    describe 'POST /users/current/articles' do
      let(:request){ ->{post current_user_articles_path, article: params} }

      context 'when article params are valid' do
        let(:params){attributes_for(:article).except(:author)}
        let(:article){ Article.last }

        it{ should redirect_to(current_user_article_path(article)) }

        it 'creates a new article' do
          params.each{ |k,v| expect(article[k]).to eq v }
        end
      end

      context 'when article params are invalid' do
        let(:params){ attributes_for(:invalid_article) }

        it{ should render_template('current_user/articles/new') }
      end
    end


    describe 'GET /users/current/articles/:id/edit' do
      let(:request){ ->{ get edit_current_user_article_path(id)} }

      context 'when article exists' do
        let(:id){ create(:article, author: @user).id }

        it{ should have_http_status(:success) }
        it{ should render_template('current_user/articles/edit') }
      end

      context 'when article doesn\'t exist' do
        let(:id){ 'no_such_article' }

        it{ should have_http_status(404) }
      end
    end


    describe 'PATCH /users/current/articles/:id' do
      let(:request){ ->{patch current_user_article_path(article.id), article: params} }
      
      context 'when article params are valid' do
        let(:article){ create(:article, author: @user) }
        let(:params){ {title: 'test', body: '123'} }

        it{ should redirect_to(current_user_article_path(article.id)) }

        it 'updates article' do
          article.reload
          params.each{ |k,v| expect(article[k]).to eq v }
        end
      end

      context 'when article params are invalid' do
        let(:article){ create(:article, author: @user) }
        let(:params){ {title: nil}}

        it{ should render_template('current_user/articles/edit') }
      end

      context 'when article doesn\'t exist' do
        let(:params){ {title: 'test', body: '123'} }
        let(:article){ double(:article, id: 'no_such_article') }

        it{ should have_http_status(404) }
      end
    end


    describe 'DELETE /users/current/articles/:id' do
      let(:request){ ->{delete current_user_article_path(article.id)} }

      context 'if article exists' do
        let(:article){ create(:article, author: @user) }

        it{ should redirect_to(current_user_articles_path) }
        it('destroys article'){ expect(Article.where(id: article.id)).to be_empty }
      end

      context 'if article doesn\'t exist' do
        let(:article){ double(:article, id: 'no_such_article') }

        it{ should have_http_status(404) }
      end
    end

  end
end