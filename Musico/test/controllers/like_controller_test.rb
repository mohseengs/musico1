require "test_helper"

class LikeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get like_index_url
    assert_response :success
  end

  test "should get song" do
    get like_song_url
    assert_response :success
  end

  test "should get playlist" do
    get like_playlist_url
    assert_response :success
  end
end
