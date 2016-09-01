require 'rails_helper'

RSpec.feature "User can login using Tumblr" do
  decribe TumblrService do
    setup_for_oauth

    visit root_path

    expect(page).to have_link "Login"

    click_link "Login"

    expect(page).to have_content "Hello, thebaconexpert"
    expect(page).to have_link "Logout"

    expect(page).not_to have_content "Login"
  end
end
