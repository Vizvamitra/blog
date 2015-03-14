require 'rails_helper'

RSpec.describe CurrentUser::ArticlesController, :type => :controller do

  before(:each){ sign_in(@user = create(:user)) }
  let(:articles){ create_list(:article, 5, author: @user) }

  describe "GET index" do
    it "assigns @articles" do
      get :index, page: '1'
      expect(assigns(:articles)).to eq @user.articles.page(1).per(10).to_a
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
      attrs = attributes_for(:article).except(:author)
      post :create, article: attrs
      attrs.each{|k,v| expect(assigns(:article)[k]).to eq v }
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
