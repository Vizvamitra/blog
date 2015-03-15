require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

  describe "GET index" do
    it "assigns @articles" do
      get :index, page: '1'
      expect(assigns(:articles)).to eq Article.published.recent.page(1).per(10).to_a
    end
  end


  describe "GET show" do
    let(:article){ create(:article, :published) }

    it "assigns @article" do
      get :show, id: article.id
      expect(assigns(:article)).to eq article
    end
  end


  describe "GET feed" do
    it "assigns @articles" do
      get :feed, format: :rss
      expect(assigns(:articles)).to eq Article.published.recent.to_a
    end
  end

end
