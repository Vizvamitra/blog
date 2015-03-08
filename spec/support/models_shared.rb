shared_context 'factory name' do
  let(:factory){ described_class.name.underscore }
end


shared_examples 'has valid factory', type: :model do
  include_context 'factory name'

  it 'has valid factory' do
     expect(build(factory)).to be_valid
  end
end