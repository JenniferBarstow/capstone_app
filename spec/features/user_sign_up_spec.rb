require "rails_helper"

feature "user can sign up" do
	scenario "user visits the home page and can sign up" do
		visit root_path

		fill_in "Email", with: "j@gmail.com"
		fill_in "First name", with: "Jennifer"
		fill_in "Last name", with: "Humphrey"
		fill_in "Password", with: "colin"

		click_on "Register"

		expect(page).to have_content("You have successfully signed up!")
		expect(page).to have_content("Logged in as Jennifer Humphrey")
	end
end