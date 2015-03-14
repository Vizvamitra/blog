require "rails_helper"

RSpec.describe "routes", type: :routing do
  it 'root' do
    expect(get("/")).to route_to("articles#index")
  end

  it 'articles' do
    expect(get('/articles')).to route_to('articles#index')
    expect(get('/articles/5')).to route_to('articles#show', id: '5')
  end

  describe 'current_user' do
    it 'articles' do
      expect(get('/users/current/articles')).to route_to('users/articles#index')
      expect(get('/users/current/articles/5')).to route_to('users/articles#show', id: '5')
      expect(get('/users/current/articles/new')).to route_to('users/articles#new')
      expect(post('/users/current/articles')).to route_to('users/articles#create')
      expect(get('/users/current/articles/5/edit')).to route_to('users/articles#edit',id:'5')
      expect(patch('/users/current/articles/5')).to route_to('users/articles#update',id:'5')
      expect(delete('/users/current/articles/5')).to route_to('users/articles#destroy',id:'5')
    end
  end
end