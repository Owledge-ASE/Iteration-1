require 'rails_helper'

RSpec.describe User, type: :model do
  describe "display_name shows correctly" do

    before :each do
      User.delete_all
      UserReaction.delete_all
      Rails.application.load_seed
    end
    context "main" do
      it "checks that display_name is last name when first name is null" do
        expect(
          User.find_by_email("prince@fakeu.edu").display_name
        ).to eq("Prince")
      end
      it "checks that display name is first + last if not otherwise set." do
        expect(
          User.find_by_email("apeterson@fakeu.edu").display_name
        ).to eq("Andrew Peterson")
      end
    end
  end

  describe "is_like_clicked shows correctly" do
    context "main" do
      before :each do
        User.delete_all
        UserReaction.delete_all
        Rails.application.load_seed
      end
      it "checks that like is false for new user reaction on a note" do
        user = User.find(User.find_by_email("apeterson@fakeu.edu").id)
        note = Note.find(Note.find_by_title("Sorting Algorithms 6").id)
        expect(
          user.is_like_clicked?(note.id).like
        ).to eq(false)
      end
      it "checks that like is true for a user that has already reacted to a note" do
        user = User.find(User.find_by_email("apeterson@fakeu.edu").id)

        note = Note.find(Note.find_by_title("Sorting Algorithms").id)
        expect(
          user.is_like_clicked?(note.id).like
        ).to eq(true)
      end
    end
  end

  describe "likes_click shows correctly" do
    context "main" do
      before :each do
        User.delete_all
        UserReaction.delete_all
        Rails.application.load_seed
      end
      it "checks that like changes to true when a user likes a note" do
        user = User.find(User.find_by_email("apeterson@fakeu.edu").id)
        note = Note.find(Note.find_by_title("Sorting Algorithms").id)
        expect(
          user.likes_click(note.id)
        ).to eq(false)
      end
      it "checks that like changes to false when a user likes a note twice" do
        user = User.find(User.find_by_email("apeterson@fakeu.edu").id)
        note = Note.find(Note.find_by_title("Sorting Algorithms").id)
        user.likes_click(note.id)
        expect(
          user.likes_click(note.id)
        ).to eq(true)
      end
    end
  end
end
