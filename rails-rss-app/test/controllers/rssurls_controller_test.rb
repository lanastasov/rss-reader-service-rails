require "test_helper"

class RssurlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rssurl = rssurls(:one)
  end

  test "should get index" do
    get rssurls_url
    assert_response :success
  end

  test "should get new" do
    get new_rssurl_url
    assert_response :success
  end

  test "should create rssurl" do
    assert_difference('Rssurl.count') do
      post rssurls_url, params: { rssurl: { url: @rssurl.url } }
    end

    assert_redirected_to rssurl_url(Rssurl.last)
  end

  test "should show rssurl" do
    get rssurl_url(@rssurl)
    assert_response :success
  end

  test "should get edit" do
    get edit_rssurl_url(@rssurl)
    assert_response :success
  end

  test "should update rssurl" do
    patch rssurl_url(@rssurl), params: { rssurl: { url: @rssurl.url } }
    assert_redirected_to rssurl_url(@rssurl)
  end

  test "should destroy rssurl" do
    assert_difference('Rssurl.count', -1) do
      delete rssurl_url(@rssurl)
    end

    assert_redirected_to rssurls_url
  end
end
