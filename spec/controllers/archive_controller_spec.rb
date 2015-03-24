require 'rails_helper'

RSpec.describe ArchiveController, :type => :controller do

  describe "GET show" do
    let(:articles){create_list(:article, 10, :published)}
    let(:other_articles){create_list(:article, 10, :not_published)}

    before(:each){ get :show }

    it "assigns @articles" do
      expect(assigns(:articles)).to match_array(articles)
    end

    it "assigns @tags" do        
      expect(assigns(:tags)).to eq Tag.order(value: :desc).limit(10)
    end
  end

end
