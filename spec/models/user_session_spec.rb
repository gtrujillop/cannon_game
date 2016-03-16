require 'rails_helper'

describe UserSession do

  describe "validations" do
  end

  describe "presence validations" do

    it { should validate_presence_of(:session_date) }
    it { should validate_presence_of(:grade) }

  end

  describe "relations" do
    it { should belong_to(:user) }
    it { should belong_to(:session) }
  end

  describe 'callbacks' do
    # it 'sets is_active value before saving the user' do
    #   user = User.new({ username: "user_1", first_name: "Juan",
    #                     last_name: "Perez", birth_date: '11-09-1988',
    #                     email:'my_email@email.com',
    #                     password: 'password_1',
    #                     password_confirmation: 'password_1'})
    #   user.save
    #   expect(User.last.active).to be_truthy
    # end

    # it 'sets format to users birth date before validation' do
    #   user = User.new( username: "user_1", first_name: "Juan",
    #                    last_name: "Perez", birth_date: "06/09/2014",
    #                    email:'my_email@email.com',
    #                    password: 'password_1',
    #                    password_confirmation: 'password_1')
    #   user.save
    #   expect(User.last.birth_date).to be_a(Date)
    # end
  end
end

