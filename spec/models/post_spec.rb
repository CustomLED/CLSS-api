require 'rails_helper'
#See admin testing and example of red/green refactoring
RSpec.describe Post, type: :model do

    before(:each) do
        @post = Post.create(name: "Dandy Warhols Club", text: "Installation for lighting, quoted 1500, cost 500")
    end

    describe "Validating name" do
        it "Should not add to database unless name given" do
            @post.name = nil
            expect(@post).to_not be_valid
        end
    end

    describe "Validating text" do
        it "Should not add to database unless text given" do
            @post.text = nil
            expect(@post).to_not be_valid
        end
    end
end

#The schema my Rspec validations are modeled from:

# create_table "posts", force: :cascade do |t|
#   t.text "name"
#   t.text "text"
#   t.bigint "admin_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["admin_id"], name: "index_posts_on_admin_id"
# end