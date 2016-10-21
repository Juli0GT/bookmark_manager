require "spec_helper"

describe User do
  subject(:user) {described_class.new}

    it 'increases the user count by one after sign up' do
      expect{User.create(email: 'anna@gmail.com', password: 'password')}.to change{user.user_count}.by(1)
    end

end
