require "rails_helper"

RSpec.describe "guest routes", type: :routing do
  it 'root' do
    expect(get("/")).to route_to("posts#index")
  end

  it 'posts' do
    expect(get('/posts')).to route_to('posts#index')
  end
end