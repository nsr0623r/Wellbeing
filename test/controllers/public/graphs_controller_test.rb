require "test_helper"

class Public::GraphsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_graphs_index_url
    assert_response :success
  end

  test "should get show" do
    get public_graphs_show_url
    assert_response :success
  end
end
