require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "creating a Reservation" do
    visit reservations_url
    click_on "New Reservation"

    fill_in "Date", with: @reservation.date
    fill_in "F name", with: @reservation.f_name
    fill_in "L name", with: @reservation.l_name
    fill_in "Make", with: @reservation.make
    fill_in "Model", with: @reservation.model
    fill_in "Phone num", with: @reservation.phone_num
    fill_in "Repair", with: @reservation.repair
    fill_in "User", with: @reservation.user_id
    fill_in "Year", with: @reservation.year
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "updating a Reservation" do
    visit reservations_url
    click_on "Edit", match: :first

    fill_in "Date", with: @reservation.date
    fill_in "F name", with: @reservation.f_name
    fill_in "L name", with: @reservation.l_name
    fill_in "Make", with: @reservation.make
    fill_in "Model", with: @reservation.model
    fill_in "Phone num", with: @reservation.phone_num
    fill_in "Repair", with: @reservation.repair
    fill_in "User", with: @reservation.user_id
    fill_in "Year", with: @reservation.year
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservation" do
    visit reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservation was successfully destroyed"
  end
end
