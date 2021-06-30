require 'rails_helper'

RSpec.describe User do
  # This is our control
  context "With valid attributes" do 
    it "should save" do 
      user = User.new(
        first_name: "John",
        last_name: "Doe",
        email: "johndoe@gmail.com"
      )
      
      expect(user).to be_valid
    end
  end
  
  context "With invalid attributes" do 
    it "should not save if first_name field is blank" do
      user = User.new(
        first_name: "", 
        last_name: "Doe", 
        email: "johndoe@gmail.com"
      )

      expect(user).to be_invalid
    end
    
    it "should not save if last_name field is blank" do
      user = User.new(
        first_name: "John", 
        last_name: "", 
        email: "johndoe@gmail.com"
      )

      expect(user).to be_invalid
    end
    
    it "should not save if email already exists" do
      user = User.create(
        first_name: "John", 
        last_name: "Doe", 
        email: "johndoe@gmail.com"
      )

      user_2 = User.create(
        first_name: "Jane", 
        last_name: "Doe", 
        email: "johndoe@gmail.com"
      )

      expect(user_2).to be_invalid
    end
    
    it "should not save if invalid email format" do
      user = User.new(
        first_name: "John", 
        last_name: "Doe", 
        email: "johndoe"
      )

      expect(user).to be_invalid
    end
  end
end
