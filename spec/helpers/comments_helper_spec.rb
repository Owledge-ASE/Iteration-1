require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CommentsHelper. For example:
#
# describe CommentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CommentsHelper, type: :helper do
  describe "return issues" do
    it "has issues" do
      comment = UserComment.create({
        comment: "",
        user_id: 1000,
        note_id: 1,
      })
      comment.valid?
      expect(CommentsHelper.generate_error_messages(comment)).to eq(
        [
          "User must exist",
          "Note must exist",
          "Comment can't be blank",
          "Comment is too short (minimum is 10 characters)",
        ]
      )
    end
  end
end
