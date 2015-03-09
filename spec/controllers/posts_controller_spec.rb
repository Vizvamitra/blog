require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  describe "GET index" do
    it "assigns @posts" do
      get :index, page: '1'
      expect(assigns(:posts)).to eq Post.published.page(1).per(10).to_a
    end
  end

  describe "GET show" do
    let(:post){ create(:post, :published) }

    it "assigns @post" do
      get :show, id: post.id
      expect(assigns(:post)).to eq post
    end
  end

end
