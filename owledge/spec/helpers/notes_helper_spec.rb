require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe NotebooksHelper, type: :helper do
  
  describe 'check if function to check the current sorting type is working' do
    context 'Call with incorrect arguments' do
      it 'Should throw an error without arguments' do
        expect {
          NotebooksHelper.checkSortDirection()
        }.to raise_error(ArgumentError)
      end
      it 'Should throw an error with only 1 arguments' do
        expect {
          NotebooksHelper.checkSortDirection("title")
        }.to raise_error(ArgumentError)
      end
    end
    context 'Proper calls' do
      it 'Should be ascending if currently descending' do
        output = NotebooksHelper.checkSortDirection("title","title-desc")
        expect(output).to eq("title-asc")
      end
      it 'Should be desc if passed ascending' do
        output = NotebooksHelper.checkSortDirection("title","title-asc")
        expect(output).to eq("title-desc")
      end
      it 'Should be ascending if 2nd variable empty' do
        output = NotebooksHelper.checkSortDirection("title","")
        expect(output).to eq("title-asc")
      end
      it 'Should be asc if other col is different' do
        output = NotebooksHelper.checkSortDirection("title","created_at-asc")
        expect(output).to eq("title-asc")
      end
      it 'Should be asc if other col is different' do
        output = NotebooksHelper.checkSortDirection("title","created_at-desc")
        expect(output).to eq("title-asc")
      end
    end
  end

  
end
