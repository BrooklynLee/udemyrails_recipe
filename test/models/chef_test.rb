require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  
  def setup
      @chef = Chef.new(chefname: "Anur Farouj", email: "farouj@recipe.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "chefname should not be too short" do
    @chef.chefname = "a"*2
    assert_not @chef.valid?
  end
  
  test "chefname should not be too long" do
    @chef.chefname = "a"*41
    assert_not @chef.valid?
  end
  
  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email length should  be within bounds" do
    @chef.chefname = "a"*101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email address should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validaion should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+joe@monk.cn]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com hello_ss-ss.org user@example. first.last@e_e_.au laura+joe@m+onk.cn]
    invalid_addresses.each do |inva|
      @chef.email = inva
      assert_not @chef.valid?, '#{inva.inspect} should be invalid'
    end
  end
 
  
end