require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/images.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Image.count, data.length
  end

  test "create" do
    assert_difference "Image.count", 1 do
      post "/images.json", params: { url: "test url", product_id: Product.first.id }
    end
  end

  test "show" do
    get "/images/#{Image.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "url", "product_id"], data.keys
  end

  test "update" do
    image = Image.first
    patch "/images/#{image.id}.json", params: { url: "Updated url" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated url", data["url"]
  end

  test "destroy" do
    assert_difference "Image.count", -1 do
      delete "/images/#{Image.first.id}.json"
      assert_response 200
    end
  end
end
