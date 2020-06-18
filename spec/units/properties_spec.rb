require 'properties.rb'

describe Property do
  subject = Property.new( name = 'house 1', price = 100, description = 'top house', id = 1, user_id = 1)

  it 'the property has a name' do
    expect(subject.name).to eq 'house 1' 
  end

  it 'the property has a price' do
    expect(subject.price).to eq 100 
  end

  it 'the property has a description' do
    expect(subject.description).to eq 'top house' 
  end

  it 'the property has an id' do
    expect(subject.id).to eq 1 
  end

end