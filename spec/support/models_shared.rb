shared_context 'factory name' do
  let(:factory){ described_class.name.underscore }
end


shared_examples 'has valid factory', type: :model do
  include_context 'factory name'

  it 'has valid factory' do
     expect(build(factory)).to be_valid
  end
end


shared_examples 'validates presence of' do |*attributes|
  include_context 'factory name'
  
  describe 'validates presence of' do
    attributes.each do |attribute|
      it "#{attribute}" do
        expect(build(factory, attribute => nil)).not_to be_valid
      end
    end
  end
end

shared_examples 'validates uniqueness of' do |*attributes|
  include_context 'factory name'
  
  describe 'validates uniqueness of' do
    attributes.each do |attribute|
      it "#{attribute}" do
        existing_item = create(factory)
        expect(build(factory, attribute => existing_item[attribute])).not_to be_valid
      end
    end
  end
end