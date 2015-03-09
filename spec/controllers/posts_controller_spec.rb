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

  describe "GET new" do
    before(:each){ sign_in(create(:user)) }

    it "assigns @post" do
      get :new
      expect(assigns(:post)).to be_a Post
      expect(assigns(:post)).to be_a_new_record
    end
  end

  describe "POST create" do
    before(:each){ sign_in(create(:user)) }

    it "assigns @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

end
