require 'rails_helper'

RSpec.describe User, type: :model do
  users = [{
              first_name: "John",
              last_name: "Johnson",
              email: "jjohnson@fakeu.edu",
              password: "password"
            },
            {
              first_name: "Mary",
              last_name: "Mumford",
              email: "mmumford@fakeu.edu",
              password: "password"
            },
            {
              last_name: "Prince",
              email: "prince@fakeu.edu",
              password: "password",
            }]

  reactions = [{
                      like: true,
                      user_id: users[0].id,
                      note_id: 1,
                    },
                    {
                      like: true,
                      user_id: users[1].id,
                      note_id: 1,
                    },
                    {
                      like: true,
                      user_id: users[2].id,
                      note_id: 2,
                    }]
  describe "display_name shows correctly" do
    context "main" do
      before :each do
        User.create(users)
      end
      it "checks that display_name is last name when first name is null" do
        expect(
          User.find_by_email("prince@fakeu.edu").display_name
        ).to eq("Prince")
      end
      it "checks that display name is first + last if not otherwise set." do
        expect(
          User.find_by_email("mmumford@fakeu.edu").display_name
        ).to eq("Mary Mumford")
      end
    end
  end

  describe "is_like_clicked shows correctly" do
    context "main" do
      before :each do
        User.create(users)
        User.create(reactions)
      end
      it "checks that like is false for new user reaction on a note" do
        id = User.find(User.find_by_email("jjohnson@fakeu.edu").id)
        expect(
          UserReaction.where(user_id: id, note_id: 2).is_like_clicked
        ).to eq(false)
      end
      it "checks that like is true for a user that has already reacted to a note" do
        id = User.find(User.find_by_email("prince@fakeu.edu").id)
        expect(
          UserReaction.where(user_id: id, note_id: 2).is_like_clicked
        ).to eq(true)
      end
    end
  end

  describe "likes_click shows correctly" do
    context "main" do
      before :each do
        User.create(users)
        User.create(reactions)
      end
      it "checks that like changes to true when a user likes a note" do
        id = User.find(User.find_by_email("jjohnson@fakeu.edu").id)
        expect(
          UserReaction.where(user_id: id, note_id: 2).likes_click
        ).to eq(true)
      end
      it "checks that like changes to false when a user likes a note twice" do
        id = User.find(User.find_by_email("jjohnson@fakeu.edu").id)
        expect(
          UserReaction.where(user_id: id, note_id: 2).likes_click
        ).to eq(false)
      end
    end
  end
end
