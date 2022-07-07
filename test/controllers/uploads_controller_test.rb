require "test_helper"

class UploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @upload = uploads(:one)
  end

  test "should get index" do
    get uploads_url, as: :json
    assert_response :success
  end

  test "should create upload" do
    assert_difference("Upload.count") do
      post uploads_url, params: { upload: { caption: @upload.caption, media: @upload.media, user_id: @upload.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show upload" do
    get upload_url(@upload), as: :json
    assert_response :success
  end

  test "should update upload" do
    patch upload_url(@upload), params: { upload: { caption: @upload.caption, media: @upload.media, user_id: @upload.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy upload" do
    assert_difference("Upload.count", -1) do
      delete upload_url(@upload), as: :json
    end

    assert_response :no_content
  end
end
