require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
    @category3 = Category.create(name: "Science")
    @category4 = Category.create(name: "Health")
    @category5 = Category.create(name: "Fashion")
    @category6 = Category.create(name: "History")
  end


  test "should show categories listing" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name

    # test for pagination
    assert_match "Page 1", response.body
  end
end
