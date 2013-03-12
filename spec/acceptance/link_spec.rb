require 'acceptance/acceptance_helper'

feature 'Link', %q{
Links should be shortened properly, and redirects need to happen correctly.
} do

  let!(:link) { FactoryGirl.create(:link, store: "http://www.google.com/", alias: 'abc456') }

  scenario 'Shortening a URL' do
    visit root_url
    fill_in "link_store", :with => "http://testsite.com"
    click_button "copy-button"
    current_alias = Link.last.alias
    current_store = Link.last.store
    page.should have_content(current_alias)
    page.should have_content(current_store)
  end

  scenario 'Redirecting through the site' do
    visit "#{root_url}/#{link.alias}"
    current_url.should == link.store
  end

end
