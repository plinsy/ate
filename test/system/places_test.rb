require "application_system_test_case"

class PlacesTest < ApplicationSystemTestCase
  setup do
    @place = places(:one)
  end

  test "visiting the index" do
    visit places_url
    assert_selector "h1", text: "Places"
  end

  test "creating a Place" do
    visit places_url
    click_on "New Place"

    fill_in "Activity", with: @place.activity_id
    fill_in "Description", with: @place.description
    fill_in "Latitude", with: @place.latitude
    fill_in "Location", with: @place.location
    fill_in "Longitude", with: @place.longitude
    check "Main" if @place.main
    fill_in "Title", with: @place.title
    fill_in "User", with: @place.user_id
    click_on "Create Place"

    assert_text "Place was successfully created"
    click_on "Back"
  end

  test "updating a Place" do
    visit places_url
    click_on "Edit", match: :first

    fill_in "Activity", with: @place.activity_id
    fill_in "Description", with: @place.description
    fill_in "Latitude", with: @place.latitude
    fill_in "Location", with: @place.location
    fill_in "Longitude", with: @place.longitude
    check "Main" if @place.main
    fill_in "Title", with: @place.title
    fill_in "User", with: @place.user_id
    click_on "Update Place"

    assert_text "Place was successfully updated"
    click_on "Back"
  end

  test "destroying a Place" do
    visit places_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Place was successfully destroyed"
  end
end
