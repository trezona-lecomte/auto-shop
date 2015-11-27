require "rails_helper"

feature "Default to the new product request page" do
  scenario "User navigates to the root URL" do
    given_i_go_to_the_root_url
    then_i_should_see_the_new_product_request_page
  end

  def given_i_go_to_the_root_url
    visit "/"
  end

  def then_i_should_see_the_new_product_request_page
    expect(page).to have_selector(:link_or_button, "Show me the best prices!")
  end
end
