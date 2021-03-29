require 'rails_helper'

RSpec.describe UserReaction, type: :model do
  describe "get_like functions correctly" do
    before :each do
      User.delete_all
      UserReaction.delete_all
      Rails.application.load_seed
    end
    context "main" do
      it "IF a user has not reacted to a note_id then a new reaction is created " do
        count1 = UserReaction.all.count
        user = User.find_by_email("prince@fakeu.edu")
        note = Note.find_by_title("Sorting Algorithms 6")
        reaction = UserReaction.get_like(user.id, note.id)
        count2 = UserReaction.all.count
        expect(count2-count1).to eq(1)

      end
      it "IF a user has already reacted to a note_id then it should return the reaction" do
        count1 = UserReaction.all.count
        user = User.find_by_email("apeterson@fakeu.edu")
        note = Note.find_by_title("Sorting Algorithms")
        reaction = UserReaction.get_like(user.id, note.id)
        count2 = UserReaction.all.count
        expect(count2-count1).to eq(0)
      end
      it "IF an invalid user_id or note_id is passed than an exception should be raised" do
        expect{
        reaction = UserReaction.get_like(1000000, 1000000)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "get_like class function is correct" do
    before :each do
      User.delete_all
      UserReaction.delete_all
      Rails.application.load_seed
    end
    context "main" do
      it "IF a user reacts to a note_id but like is set to nil" do
        user = User.find_by_email("prince@fakeu.edu")
        note = Note.find_by_title("Sorting Algorithms 6")
        reaction = UserReaction.create(user_id: user.id, note_id: note.id)
        reaction.like = reaction.get_like.zero?
        expect(reaction.like).to eq(true)
      end
    end
  end
end
