require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

  describe "GET index" do
    before(:each) do
      @articles = [
        create(:article, :published, tags: ['tea']),
        create(:article, :published, tags: ['coffee']),
        create(:article, :not_published)
      ]
    end

    context 'tags not given' do
      before(:each){get :index, page: '1'}

      it "assigns @articles" do        
        expect(assigns(:articles)).to match_array @articles[0..1]
      end

      it 'orders articles by published_at' do
        expect(assigns(:articles)).to be_ordered_by(:published_at)
      end
    end

    context 'tags given' do
      before(:each){get :index, page: '1', tags: ['tea']}

      it "assigns @articles with given tag" do
        expect(assigns(:articles)).to eq @articles[0..0]
      end

      it 'orders articles by published_at' do
        expect(assigns(:articles)).to be_ordered_by(:published_at)
      end
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
