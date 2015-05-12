require "rails_helper"

RSpec.describe "routes", type: :routing do
  it 'root' do
    expect(get("/")).to route_to("articles#index")
  end

  it 'articles' do
    expect(get('/articles')).to route_to('articles#index')
    expect(get('/articles/5')).to route_to('articles#show', id: '5')
    expect(get('/articles/feed')).to route_to('articles#feed', format: :rss)
  end

  it 'archive' do
    expect(get('/archive')).to route_to('archive#show')
  end

  describe 'admin' do
    it 'articles' do
      expect(get('admin/articles')).to\
        route_to('admin/articles#index')
        
      expect(get('admin/articles/5')).to\
        route_to('admin/articles#show', id: '5')
        
      expect(get('admin/articles/new')).to\
        route_to('admin/articles#new')
        
      expect(post('admin/articles')).to\
        route_to('admin/articles#create')
        
      expect(get('admin/articles/5/edit')).to\
        route_to('admin/articles#edit',id:'5')
        
      expect(patch('admin/articles/5')).to\
        route_to('admin/articles#update',id:'5')
        
      expect(delete('admin/articles/5')).to\
        route_to('admin/articles#destroy',id:'5')
        
    end
  end
end