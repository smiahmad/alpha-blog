require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
      @category = Category.new(name: "Sports")
  end

  test "category should be valid" do
      assert @category.valid?
  end

  test "name should be present" do
    @category.name= " "
    assert_not(@category.valid?)
  end

  test "name should be unnique" do
    #first save into the database
    @category.save

    #create another one with the same name
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "name should not be too long" do
    # assuming max is 25
    @category.name = "a" * 26
      assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "a"
    assert_not @category.valid?
  end


end
