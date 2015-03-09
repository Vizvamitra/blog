require "rails_helper"

RSpec.describe "guest routes", type: :routing do
  it 'root' do
    expect(get("/")).to route_to("posts#index")
  end

  it 'posts' do
    expect(get('/posts')).to route_to('posts#index')
    expect(get('/posts/5')).to route_to('posts#show', id: '5')
    expect(get('/posts/new')).to route_to('posts#new')
  end
end