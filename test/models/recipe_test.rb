require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
   
   def setup
        @chef = Chef.create(chefname: "bob", email: "bob@example.com")
        @recipe = @chef.recipes.build(name: "chiken parm", summary: "this is the best chiken parm recipe ever",
        description: "add oil, add onions, add tomato sauce, add chicken and cook for 30 minutes ")
   end
    
    
    test "recipe should be valid" do 
      assert @recipe.valid?
    end
    
    test "chef_id should be present" do
      @recipe.chef_id = nil
      assert_not @recipe.valid?
    
    end
   
    test "name should be present" do
      @recipe.name = " "
      assert_not @recipe.valid?
    end
    test "name  length should not be too long" do
      @recipe.name = "z" * 101
      assert_not @recipe.valid?
    end
   
    test "name  length should not be too short" do
      @recipe.name = "a" * 4
      assert_not @recipe.valid?
    end
    
    
    
    test "summary should be present" do
      @recipe.summary = " "
      assert_not @recipe.valid?
    end
    
    test "summary  length should not be too long" do
      @recipe.summary = "s" * 151
      assert_not @recipe.valid?
    end
   
    test "summary  length should not be too short" do
       @recipe.summary = "s" * 9
       assert_not @recipe.valid?
    end
    
    
    test "description should be present" do
      @recipe.description = " "
      assert_not @recipe.valid?
    end
    test "description  length should not be too long" do
       @recipe.description = "d" * 501
      assert_not @recipe.valid?
    end
   
    test "description  length should not be too short" do
        @recipe.description = "d" * 19
        assert_not @recipe.valid?
    end
end