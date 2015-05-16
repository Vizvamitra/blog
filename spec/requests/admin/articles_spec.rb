require 'rails_helper'

RSpec.describe 'Admin/Articles' do
  
  shared_examples 'redirects to login page' do
    it{ should have_http_status(302) }
    it{ should redirect_to new_user_session_path }
  end

  subject{ response }

  describe 'for guest' do
    before(:each){ request.call }

    describe 'GET index' do
      let(:request){ ->{get admin_articles_path} }
      it_behaves_like 'redirects to login page'
    end

    describe 'GET show' do
      let(:request){ ->{get admin_article_path(create(:article))} }
      it_behaves_like 'redirects to login page'
    end

     describe 'GET /users/current/articles/new' do
      let(:request){ ->{get new_admin_article_path} }
      it_behaves_like 'redirects to login page'
    end

    describe 'GET /users/current/articles/:id/edit' do
      let(:request){ ->{get edit_admin_article_path(create(:article))} }
      it_behaves_like 'redirects to login page'
    end

    describe 'POST /users/current/articles' do
      let(:request){ ->{post admin_articles_path} }
      it_behaves_like 'redirects to login page'
    end

    describe 'PATCH /users/current/articles/:id' do
      let(:request){ ->{patch admin_article_path(create(:article))} }
      it_behaves_like 'redirects to login page'
    end

    describe 'DELETE /users/current/articles/:id' do
      let(:request){ ->{delete admin_article_path(create(:article))} }
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
      let(:request){ ->{get admin_articles_path} }

      it{ should have_http_status(:success) }
      it{ should render_template(:index) }
    end


    describe 'GET /users/current/articles/:id' do
      let(:request){ ->{ get admin_article_path(id)} }
      
      context 'when article existsd' do
        let(:id){ create(:article, author: @user).id }

        it { should have_http_status(:success) }
        it { should render_template('admin/articles/show') }
      end

      context 'when article doesn\'t exist' do
        let(:id){'no_such_article'}

        it { should have_http_status(:not_found) }
      end
    end


    describe 'GET /users/current/articles/new' do
      let(:request){ ->{ get new_admin_article_path} }

      it{ should have_http_status(:success) }
      it{ should render_template('admin/articles/new') }
    end


    describe 'POST /users/current/articles' do
      let(:request){ ->{post admin_articles_path, article: params} }

      context 'when article params are valid' do
        let(:params){attributes_for(:article).except(:author, :snippets).merge(snippets_attributes: [{_type: 'Snippets::Text', body: 'test'}])}

        it{ should redirect_to(admin_article_path(Article.last)) }

        it 'creates a new article' do
          params.except(:snippets_attributes).each{ |k,v| expect(Article.last[k]).to eq v }
        end
      end

      context 'when article params are invalid' do
        let(:params){ attributes_for(:invalid_article) }

        it{ should render_template('admin/articles/new') }
      end
    end


    describe 'GET /users/current/articles/:id/edit' do
      let(:request){ ->{ get edit_admin_article_path(id)} }

      context 'when article exists' do
        let(:id){ create(:article, author: @user).id }

        it{ should have_http_status(:success) }
        it{ should render_template('admin/articles/edit') }
      end

      context 'when article doesn\'t exist' do
        let(:id){ 'no_such_article' }

        it{ should have_http_status(404) }
      end
    end


    describe 'PATCH /users/current/articles/:id' do
      let(:request){ ->{patch admin_article_path(article.id), article: params} }
      
      context 'when article params are valid' do
        let(:article){ create(:article, author: @user, snippets: [Snippets::Text.new(body: 'snippet1'), Snippets::Embed.new(body: 'snippet2')]) }
        let(:params){ {title: 'new title'} }

        it{ should redirect_to(admin_article_path(article.reload)) }

        describe 'when creating snippet' do
          let(:params){ {snippets_attributes: {"0" => {_type: 'Snippets::Text', body: 'test'}}} }

          it 'creates new snippet on given position' do
            article.reload
            expect(article.snippets.count).to eq 3
            expect(article.snippets.last.body).to eq 'test'
          end
        end

        describe 'when updating snippet' do
          let(:params){ {snippets_attributes: {"0" => {_id: article.snippets.first._id.to_s, _type: 'Snippets::Text', body: 'test'}}} }

          it 'updates snippet' do
            article.reload
            expect(article.snippets.count).to eq 2
            expect(article.snippets.first.body).to eq 'test'
          end
        end

        describe 'when destroying snippet' do
          let(:params){ {snippets_attributes: {"0" => {_id: article.snippets.first._id.to_s, _type: 'Snippets::Text', body: 'test', _destroy: true}}} }

          it 'destroys snippet' do
            article.reload
            expect(article.snippets.count).to eq 1
            expect(article.snippets.first.body).to eq 'snippet2'
          end
        end
      end

      context 'when article params are invalid' do
        let(:article){ create(:article, author: @user) }
        let(:params){ {title: nil}}

        it{ should render_template('admin/articles/edit') }
      end

      context 'when article doesn\'t exist' do
        let(:params){ {title: 'test', body: '123'} }
        let(:article){ double(:article, id: 'no_such_article') }

        it{ should have_http_status(404) }
      end
    end


    describe 'DELETE /users/current/articles/:id' do
      let(:request){ ->{delete admin_article_path(article.id)} }

      context 'if article exists' do
        let(:article){ create(:article, author: @user) }

        it{ should redirect_to(admin_articles_path) }
        it('destroys article'){ expect(Article.where(id: article.id)).to be_empty }
      end

      context 'if article doesn\'t exist' do
        let(:article){ double(:article, id: 'no_such_article') }

        it{ should have_http_status(404) }
      end
    end

  end
end