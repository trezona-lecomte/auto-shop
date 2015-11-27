require "rails_helper"

feature "Authenticate" do
  scenario "New anonymous user navigates to sign in page" do
    # given_i_have_not_authenticated_before
    when_i_go_to_the_home_page
    then_i_should_see_a_welcome_message
    and_i_should_see_a_twitter_authentication_option
  end

  # def given_i_have_not_authenticated_before

  # end

  def when_i_go_to_the_home_page
    visit "/"
  end

  def then_i_should_see_a_welcome_message
    expect(page).to have_content(
      "Welcome to autoshop!"
    )
  end

  def and_i_should_see_a_twitter_authentication_option
    expect(page).to have_selector(:link_or_button, text: "Sign in with Twitter")
  end
end
