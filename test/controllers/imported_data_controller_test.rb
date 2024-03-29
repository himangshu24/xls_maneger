require "test_helper"

class ImportedDataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get imported_data_index_url
    assert_response :success
  end

  test "should get create" do
    get imported_data_create_url
    assert_response :success
  end

  test "should get destroy" do
    get imported_data_destroy_url
    assert_response :success
  end
end
