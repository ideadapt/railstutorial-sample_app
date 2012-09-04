require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Sample App') }

    it { should have_selector 'title',
                              text: "Ruby on Rails Tutorial Sample App" }

    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do

    it "should have the h1 'Help'" do
      visit help_path
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      page.should have_selector('title',
                                :text => "Ruby on Rails Tutorial Sample App | Help")
    end
  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit about_path
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit about_path
      page.should have_selector('title',
                                :text => "Ruby on Rails Tutorial Sample App | About Us")
    end
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: "Ruby on Rails Tutorial Sample App | About Us"
    click_link "Help"
    page.should have_selector 'title', text: "Ruby on Rails Tutorial Sample App | Help"
    click_link "Home"
    click_link "Sign in"
    page.should have_selector 'title', text: "Ruby on Rails Tutorial Sample App | Sign up"
    click_link "sample app"
    page.should have_selector 'title', text: "Ruby on Rails Tutorial Sample App"
  end
end