require "application_system_test_case"

class RssurlsTest < ApplicationSystemTestCase
  setup do
    @rssurl = rssurls(:one)
  end

  test "visiting the index" do
    visit rssurls_url
    assert_selector "h1", text: "Rssurls"
  end

  test "creating a Rssurl" do
    visit rssurls_url
    click_on "New Rssurl"

    fill_in "Url", with: @rssurl.url
    click_on "Create Rssurl"

    assert_text "Rssurl was successfully created"
    click_on "Back"
  end

  test "updating a Rssurl" do
    visit rssurls_url
    click_on "Edit", match: :first

    fill_in "Url", with: @rssurl.url
    click_on "Update Rssurl"

    assert_text "Rssurl was successfully updated"
    click_on "Back"
  end

  test "destroying a Rssurl" do
    visit rssurls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rssurl was successfully destroyed"
  end
end
