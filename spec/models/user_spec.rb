require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'must have all fields filled (email, first name & last name)' do
      @user = User.new(first_name: "Jade", last_name: "Duong", email: "jd@jd.com", password: "jd101", password_confirmation: "jd101")
      
      expect(@user).to be_valid
    end
    it 'must have both password and password_confirmation fields matching' do
      @user = User.new(first_name: "Jade", last_name: "Duong", email: "jd@jd.com", password: "jd202", password_confirmation: "jd101")

      expect(@user).not_to be_valid
    end
    it 'must have a unique email not already registered' do
      @user1 = User.new(first_name: "Jade", last_name: "Duong", email: "jd@jd.com", password: "jd101", password_confirmation: "jd101")
      @user1.save

      @user2 = User.new(first_name: "Jade", last_name: "Duong", email: "jd@jd.com", password: "jd101", password_confirmation: "jd101")
      
      expect(@user2).not_to be_valid
    end
    it 'must have a password with 3 characters or more' do
      @user = User.new(first_name: "Jade", last_name: "Duong", email: "jd@jd.com", password: "jd", password_confirmation: "jd")

    end  
  end


  describe '.authenticate_with_credentials' do
    it 'should return nil if login fails' do
      @user = User.new(first_name: "Jade", last_name: "Duong", email: "jd@jd.com", password: "jd101", password_confirmation: "jd101")
      @user.save

      expect(User.authenticate_with_credentials("jd@jdddd.com", "jd101")).to eq(nil)
    end
    it 'should return the user who logs in correctly' do
      @user = User.new(first_name: "Jade", last_name: "Duong", email: "jd@jd.com", password: "jd101", password_confirmation: "jd101")
      @user.save

      expect(User.authenticate_with_credentials("jd@jd.com", "jd101")).to eq(@user)
    end
    it "should authenticate the user if there's a wrong case in the email" do
      @user = User.new(first_name: "Jade", last_name: "Duong", email: "jd@jd.com", password: "jd101", password_confirmation: "jd101")

      @user.save
      expect(User.authenticate_with_credentials("JD@JD.com", "jd101")).to eq(@user)
    end

    it "should authenticate the user if there's blank space before and after the email" do
      @user = User.new(first_name: "Jade", last_name: "Duong", email: "jd@jd.com", password: "jd101", password_confirmation: "jd101")
      @user.save

      expect(User.authenticate_with_credentials("     jd@jd.com  ", "jd101")).to eq(@user)
    end
  end


end
