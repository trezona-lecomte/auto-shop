require "rails_helper"

feature "Find offers for a product" do
  scenario "Anonymous user searches for a product" do
    given_i_am_on_the_product_request_page
    and_i_enter_a_product_name
    when_i_click_the_enter_button
    then_i_should_see_a_success_message
    and_i_should_see_at_least_one_offer
  end

  def given_i_am_on_the_product_request_page
    visit new_product_request_path
  end

  def and_i_enter_a_product_name
    fill_in "Product", with: product_name
  end

  def when_i_click_the_enter_button
    click_button "Show me the best prices!"
  end

  def then_i_should_see_a_success_message
    expect(page).to have_content(
      "Here are the best prices we could find for a #{product_name}:"
    )
  end

  def and_i_should_see_at_least_one_offer
    expect(page).to have_content("Offer:")
  end

  def product_name
    @name ||= Faker::Commerce.product_name
  end
end
