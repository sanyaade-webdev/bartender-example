require 'spec_helper'

describe Beer do
  it { should respond_to(:id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:abv) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:created_at) }
end

describe Beer, '#brewery' do
  subject { Beer.new(:brewery => attributes) }

  let!(:brewery)   { Brewery.new(attributes) }
  let(:attributes) { { :id => 1 }}

  before do
    Brewery.stubs(:new).returns(brewery)
  end

  it 'creates a brewery object once' do
    subject.brewery
    subject.brewery
    Brewery.should have_received(:new).with(attributes).once
  end

  it 'returns the brewery object' do
    brewery = subject.brewery
    brewery.should be_a(Brewery)
    brewery.id.should == 1
  end
end

describe Beer, '.count' do
  let(:response) { { 'total' => 12 } }

  before do
    Bartender::Beer.stubs(:all).returns(response)
  end

  it 'retrieves one beer to determine the count' do
    Beer.count
    Bartender::Beer.should have_received(:all).with(:per_page => 1)
  end

  it 'returns the count' do
    Beer.count.should == 12
  end
end

describe Beer, '.find' do
  let!(:beer)       { Beer.new(attributes) }
  let!(:attributes) { { :id => 1 } }

  before do
    Beer.stubs(:new).returns(beer)
    Bartender::Beer.stubs(:find).returns(attributes)
  end

  it 'retrieves the requested beer' do
    Beer.find(1)
    Bartender::Beer.should have_received(:find).with(1)
  end

  it 'creates a beer object' do
    Beer.find(1)
    Beer.should have_received(:new).with(attributes)
  end

  it 'returns the requested beer' do
    beer = Beer.find(1)
    beer.should be_a(Beer)
    beer.id.should == 1
  end
end

describe Beer, '.paginate' do
  let!(:beer)      { Beer.new(attributes) }
  let(:response)   { { 'page' => 1, 'pages' => 3, 'total' => 12, 'beers' => [attributes] } }
  let(:attributes) { { :id => 1 } }
  let(:collection) { stub('Collection') }

  before do
    collection.stubs(:replace).returns(collection)
    Beer.stubs(:new).returns(beer)
    Bartender::Beer.stubs(:all).returns(response)
    WillPaginate::Collection.stubs(:new).returns(collection)
  end

  it 'retrieves beers with provided options' do
    Beer.paginate(:page => 1)
    Bartender::Beer.should have_received(:all).with(:page => 1)
  end

  it 'creates a collection' do
    Beer.paginate
    WillPaginate::Collection.should have_received(:new).with(1, 50, 12)
  end

  it 'creates beer objects for each result' do
    Beer.paginate
    Beer.should have_received(:new).with(attributes)
  end

  it 'populates the collection' do
    Beer.paginate
    collection.should have_received(:replace).with([beer])
  end

  it 'returns the collection' do
    Beer.paginate.should == collection
  end
end
