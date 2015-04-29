require 'rails_helper'

RSpec.describe Article, :type => :model do

  describe 'validations' do
    it{ should validate_presence_of(:title) }
    it{ should validate_presence_of(:body) }
    it{ should validate_presence_of(:author) }
  end


  describe 'scopes' do
    describe 'recent' do
      it 'orders articles by published_at descending' do
        create(:article, :published, published_at: Time.now)
        create(:article, :published, published_at: Date.yesterday)
        expect(Article.recent).to be_ordered_by(:published_at, :desc)
      end
    end

    describe 'tagged' do
      before(:each) do
        @articles = [
          create(:article, tags: ['tea']),
          create(:article, tags: ['lol', 'tea']),
          create(:article, tags: ['honey'])
        ]
      end

      context 'array of tags given' do
        it 'returns articles with given tags' do
          expect(Article.tagged('tea')).to match_array @articles[0..1]
          expect(Article.tagged(['lol', 'tea'])).to eq [@articles[1]]
        end
      end

      context 'nil given' do
        it 'returns all articles' do
          expect(Article.tagged(nil)).to match_array @articles
        end
      end
    end
  end


  describe 'callbacks' do

    describe 'after_save' do
      it 'starts RecalculateTags job' do
        expect(RecalculateTagsJob).to receive(:perform_later)
        create(:article, tags: ['test_tag'])
      end
    end

  end


  describe '#preview_html' do
    let(:article){create(:article, body: "##test\n[more][/more]cutted\ncutted")}

    it 'returns cutted body' do
      expect(article.preview_html).not_to match(/(more|cutted)/)
    end

    it 'returns markdownized body' do
      expect(article.preview_html).to eq RDiscount.new("##test\n").to_html
    end
  end

  describe '#body_html' do
    let(:article){create(:article, body: "##test\n[more][/more]cutted\ncutted")}

    it 'returns body without [more] tag' do
      expect(article.body_html).not_to match(/(more|[\[\]\\])/)
    end

    it 'returns markdownized body' do
      expect(article.body_html).to eq RDiscount.new("##test\ncutted\ncutted").to_html
    end
  end

end
