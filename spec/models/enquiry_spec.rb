require 'rails_helper'
#See enquiry model testing and example of red/green refactoring
RSpec.describe Enquiry, type: :model do

    before(:each) do
        @enquiry = Enquiry.create(first_name: "Jordan", last_name: "Bradley", organisation: "Showgirls", email: "test@gmail.com", phone_number: 0414103252, description: "wow what a test")
    end

    describe "Validating phone number" do
        it "should not allow visitors to create without phone_number" do
            @enquiry.phone_number = nil
            expect(@enquiry).to_not be_valid
        end
    end

    describe "Validating description" do
        it "should not allow visitors to create without a description" do
            @enquiry.description = nil
            expect(@enquiry).to_not be_valid
        end
    end

    describe "Validating first name" do
        it "should not allow visitors to create without entering a first name" do
            @enquiry.first_name = nil
            expect(@enquiry).to_not be_valid
        end
    end

    describe "Validating last name" do
        it "should not allow visitors to create without entering a last name" do
            @enquiry.last_name = nil
            expect(@enquiry).to_not be_valid
        end
    end

    describe "Validating organisation" do
        it "should not allow visitors to create without entering their organisation name" do
            @enquiry.organisation = nil
            expect(@enquiry).to_not be_valid
        end
    end

    describe "Validating email" do
        it "should not allow visitors to create without entering their email" do
            @enquiry.email = nil
            expect(@enquiry).to_not be_valid
        end
    end
end
    

#The schema my Rspec validations are modeled from:

    #     describe "validation" do
    #         it "should not allow admin creation without email address" do
    #             @admin.email = nil
    #             expect(@admin).to_not be_valid
    #         end
    #     end
    
    #     describe "validations" do
    #         it "should not allow admin creation without a password" do
    #             @admin.password = nil
    #             expect(@admin).to_not be_valid
    #         end
    #     end
    # end
    # end

    

# create_table "enquiries", force: :cascade do |t|
    #   t.string "first_name"
    #   t.string "last_name"
    #   t.string "organisation"
    #   t.string "email"
    #   t.integer "phone_number"
    #   t.text "description"
    #   t.bigint "admin_id", null: false
    #   t.datetime "created_at", precision: 6, null: false
    #   t.datetime "updated_at", precision: 6, null: false
    #   t.index ["admin_id"], name: "index_enquiries_on_admin_id"
    # end