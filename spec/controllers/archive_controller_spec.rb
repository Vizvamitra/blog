require 'rails_helper'

RSpec.describe ArchiveController, :type => :controller do

  describe "GET show" do
    let(:articles){create_list(:article, 10, :published)}
    let(:other_articles){create_list(:article, 10, :not_published)}

    it "assigns @articles" do
      get :show
      expect(assigns(:articles)).to match_array(articles)
    end
  end

end
