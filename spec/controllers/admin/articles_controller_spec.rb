require 'rails_helper'

RSpec.describe Admin::ArticlesController, :type => :controller do

  before(:each){ sign_in(@user = create(:user)) }
  let!(:articles){ create_list(:article, 3, :published, author: @user) }
  let!(:other_articles){ create_list(:article, 3, :not_published, author: @user) }

  describe "GET index" do

    context 'no scope given' do
      it "assigns @articles with all articles" do
        get :index, page: '1'
        expect(assigns(:articles)).to eq @user.articles.recent.page(1).per(10).to_a
      end
    end

    context 'valid scope given' do
      it "assigns @articles scoped to given scope" do
        ['all', 'published', 'not_published'].each do |scope|
          get :index, page: '1', scope: scope
          expect(assigns(:articles)).to eq @user.articles.recent.send(scope).page(1).per(10).to_a
        end
      end
    end

    context 'invalid scope given' do
      it "assigns @articles with all articles" do
        get :index, page: '1', scope: 'hacking'
        expect(assigns(:articles)).to eq @user.articles.recent.page(1).per(10).to_a
      end
    end
    
  end


  describe "GET show" do
    it "assigns @article" do
      get :show, id: articles[0].id
      expect(assigns(:article)).to eq articles[0]
    end
  end


  describe "GET new" do
    it "assigns @article" do
      get :new
      expect(assigns(:article)).to be_a Article
      expect(assigns(:article)).to be_a_new_record
    end
  end


  describe "POST create" do
    it "assigns @article" do
      attrs = attributes_for(:article).except(:author, :snippets).merge!(snippets_attributes: [{_type: 'Snippets::Text'}.merge(attributes_for(:text_snippet))])
      post :create, article: attrs
      expect(assigns(:article)).to eq Article.last
    end
  end


  describe "GET edit" do
    it "assigns @article" do
      get :edit, id: articles[0].id
      expect(assigns(:article)).to eq articles[0]
    end
  end


  describe "PATCH update" do
    it "assigns @article" do
      patch :update, id: articles[0].id, article: {title: '123'}
      expect(assigns(:article)).to eq articles[0]
    end
  end

end
