require 'spec_helper'

describe LinksController do

  let!(:http_link) { FactoryGirl.create(:link, store: 'http://something.com', alias: '123456') }
  let!(:non_http_link) { FactoryGirl.create(:link, store: 'something.com', alias: 'abc123') }

  describe "POST #create" do
    it "shortens a link correctly" do
      post :create, link: FactoryGirl.attributes_for(:link)
      Link.last.alias.should_not be_nil
    end
    it "saves a link to the database" do
      expect {
        post :create, link: FactoryGirl.attributes_for(:link)
      }.to change{Link.count}.by(1)
    end
  end

  describe "#redirect" do
    it "redirects to the correct link that contained http" do
      get :redirect, alias: http_link.alias
      expect(response).to redirect_to('http://something.com')
    end
    it "redirects to the correct link that doesn't contained http" do
      get :redirect, alias: non_http_link.alias
      expect(response).to redirect_to('http://something.com')
    end
  end

end
