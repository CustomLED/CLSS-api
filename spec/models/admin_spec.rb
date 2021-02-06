require 'rails_helper'
#See admin testing and example of red/green refactoring
RSpec.describe Admin, type: :model do

    before(:each) do
        @admin = Admin.create!(username: "Steven", email: "test@gmail.com", password_digest: "password")
    end

    describe "Validate Num Admin = 1" do
        it "should have one admin created after creation" do
            expect(Admin.all.count).to eq(1)
        end
    end

    describe "Validate Email" do
        it "should not allow admin creation without email address" do
            @admin.email = nil
            expect(@admin).to_not be_valid
        end
    end

    describe "Validate Password" do
        it "should not allow admin creation without a password" do
            @admin.password = nil
            expect(@admin).to_not be_valid
        end
    end
end

#The schema my Rspec validations are modeled from:
# create_table "admins", force: :cascade do |t|
#   t.string "username"
#   t.string "email"
#   t.string "password_digest"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
# end