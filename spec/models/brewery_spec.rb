require 'spec_helper'

describe Brewery do
  it { should respond_to(:id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:created_at) }
end

describe Brewery, '.find' do
  let!(:brewery)    { Brewery.new(attributes) }
  let!(:attributes) { { :id => 1 } }

  before do
    Brewery.stubs(:new).returns(brewery)
    Bartender::Brewery.stubs(:find).returns(attributes)
  end

  it 'retrieves the requested brewery' do
    Brewery.find(1)
    Bartender::Brewery.should have_received(:find).with(1)
  end

  it 'creates a brewery object' do
    Brewery.find(1)
    Brewery.should have_received(:new).with(attributes)
  end

  it 'returns the requested brewery' do
    brewery = Brewery.find(1)
    brewery.should be_a(Brewery)
    brewery.id.should == 1
  end
end

describe Brewery, '.paginate' do
  let!(:brewery)   { Brewery.new(attributes) }
  let(:response)   { { 'page' => 1, 'pages' => 3, 'total' => 12, 'breweries' => [attributes] } }
  let(:attributes) { { :id => 1 } }
  let(:collection) { stub('Collection') }

  before do
    collection.stubs(:replace).returns(collection)
    Brewery.stubs(:new).returns(brewery)
    Bartender::Brewery.stubs(:all).returns(response)
    WillPaginate::Collection.stubs(:new).returns(collection)
  end

  it 'retrieves breweries with provided options' do
    Brewery.paginate(:page => 1)
    Bartender::Brewery.should have_received(:all).with(:page => 1)
  end

  it 'creates a collection' do
    Brewery.paginate
    WillPaginate::Collection.should have_received(:new).with(1, 50, 12)
  end

  it 'creates brewery objects for each result' do
    Brewery.paginate
    Brewery.should have_received(:new).with(attributes)
  end

  it 'populates the collection' do
    Brewery.paginate
    collection.should have_received(:replace).with([brewery])
  end

  it 'returns the collection' do
    Brewery.paginate.should == collection
  end
end
