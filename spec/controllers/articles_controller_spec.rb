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

end
