require 'spec_helper'

describe Link do

  it { should validate_uniqueness_of(:alias) }
  it { should validate_presence_of(:store) }

  let(:link1) { FactoryGirl.build(:link) }

  it 'creates a link within the shorten method' do
    Link.shorten(link1)
    Link.last.should_not be_nil
  end

  it 'creates an alias' do
    Link.shorten(link1)
    Link.last.alias.should_not be_nil
  end

 it 'creates a unique alias'

end
