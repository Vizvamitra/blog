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

  describe 'current_user' do
    it 'articles' do
      expect(get('/users/current/articles')).to\
        route_to('current_user/articles#index')
        
      expect(get('/users/current/articles/5')).to\
        route_to('current_user/articles#show', id: '5')
        
      expect(get('/users/current/articles/new')).to\
        route_to('current_user/articles#new')
        
      expect(post('/users/current/articles')).to\
        route_to('current_user/articles#create')
        
      expect(get('/users/current/articles/5/edit')).to\
        route_to('current_user/articles#edit',id:'5')
        
      expect(patch('/users/current/articles/5')).to\
        route_to('current_user/articles#update',id:'5')
        
      expect(delete('/users/current/articles/5')).to\
        route_to('current_user/articles#destroy',id:'5')
        
    end
  end
end