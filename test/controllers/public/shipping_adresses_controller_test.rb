require "test_helper"

class Public::ShippingAdressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_shipping_adresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_shipping_adresses_edit_url
    assert_response :success
  end
end
