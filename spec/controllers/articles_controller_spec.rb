require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

  describe "GET index" do
    it "assigns @articles" do
      get :index, page: '1'
      expect(assigns(:articles)).to eq Article.published.page(1).per(10).to_a
    end
  end


  describe "GET show" do
    let(:article){ create(:article, :published) }

    it "assigns @article" do
      get :show, id: article.id
      expect(assigns(:article)).to eq article
    end
  end


  describe "GET new" do
    before(:each){ sign_in(create(:user)) }

    it "assigns @article" do
      get :new
      expect(assigns(:article)).to be_a Article
      expect(assigns(:article)).to be_a_new_record
    end
  end


  describe "POST create" do
    before(:each){ sign_in(create(:user)) }

    it "assigns @article" do
      attrs = attributes_for(:article).except(:author)
      post :create, article: attrs
      attrs.each{|k,v| expect(assigns(:article)[k]).to eq v }
    end
  end


  describe "GET edit" do
    before(:each) do
      @user = create(:user)
      sign_in(@user)
    end

    it "assigns @article" do
      article = create(:article, author: @user.id)
      get :edit, id: article.id
      expect(assigns(:article)).to eq article
    end
  end


  describe "PATCH update" do
    before(:each) do
      @user = create(:user)
      sign_in(@user)
    end

    it "assigns @article" do
      article = create(:article, author: @user.id)
      patch :update, id: article.id, article: {title: '123'}
      expect(assigns(:article)).to eq article
    end
  end

end
