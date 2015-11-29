require "rails_helper"

feature "Authentication" do
  scenario "Anonymous user navigates to sign in page" do
    given_i_am_on_the_home_page
    then_i_should_see_a_welcome_message
    and_i_should_see_a_twitter_authentication_option
  end

  scenario "User signs in" do
    given_i_am_on_the_home_page
    when_i_authenticate_using_twitter
    then_i_should_be_signed_in
    and_i_should_not_see_a_sign_in_link
  end

  ### Step definitions ###

  def given_i_am_on_the_home_page
    visit "/"
  end

  def when_i_authenticate_using_twitter
    click_link("Sign in with Twitter")
  end

  def then_i_should_see_a_welcome_message
    expect(page).to have_content("Welcome to CV Bundler!")
  end

  def and_i_should_see_a_twitter_authentication_option
    expect(page).to have_selector(:link_or_button, text: "Sign in with Twitter")
  end

  def then_i_should_be_signed_in
    expect(page).to have_selector(:link, text: "Sign out")
  end

  def and_i_should_not_see_a_sign_in_link
    expect(page).not_to have_content("Sign in with Twitter")
  end
end
