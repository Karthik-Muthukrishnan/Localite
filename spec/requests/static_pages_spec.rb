require 'spec_helper'

describe "Static Pages" do

  describe "Home page" do
    before { visit root_path }
    it "should have the content 'Localite'" do
      expect(page).to have_content('Localite')
    end

    it "should not have a custom page title" do
      expect(page).not_to have_title('| Home')
    end

  end

  describe "About Page" do
    before {visit about_path}
  	it "should have the content 'About'" do
  		expect(page).to	have_content('About')
  	end
  end



end

