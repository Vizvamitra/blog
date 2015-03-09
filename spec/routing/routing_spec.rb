require "rails_helper"

RSpec.describe "routes", type: :routing do
  it 'root' do
    expect(get("/")).to route_to("articles#index")
  end

  it 'articles' do
    expect(get('/articles')).to route_to('articles#index')
    expect(get('/articles/5')).to route_to('articles#show', id: '5')
    expect(get('/articles/new')).to route_to('articles#new')
    expect(post('/articles')).to route_to('articles#create')
    expect(get('/articles/5/edit')).to route_to('articles#edit', id: '5')
    expect(patch('/articles/5')).to route_to('articles#update', id: '5')
  end
end