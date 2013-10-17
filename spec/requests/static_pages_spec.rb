require 'spec_helper'

describe "Static Pages" do

  describe "Home page" do

    it "should have the content 'Localite'" do
      visit '/static_pages/home'
      expect(page).to have_content('Localite')
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end

  end

  describe "About Page" do

  	it "should have the content 'About'" do
  		visit '/static_pages/about'
  		expect(page).to	have_content('About')
  	end
  end



end

