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

  
  describe 'check if setting up tags is working' do
    context 'Check if tags can be loaded in properly' do
      before :each do
        Rails.application.load_seed 
      end
      it 'Passing in a completely new set of tags' do
        NotebooksHelper.setupTags('bootstrap,layout,test')
        tags = Tag.all
        expect(tags.count).to eq(5)
      end
      it 'Passing in only an old set of tags' do
        NotebooksHelper.setupTags('sorting,graph')
        tags = Tag.all
        expect(tags.count).to eq(2)
      end
      it 'Passing in both new and old set of tags' do
        NotebooksHelper.setupTags('sorting,bootstrap')
        tags = Tag.all
        expect(tags.count).to eq(3)
      end
    end


    describe 'check if fetching tags for a notebook is working' do
      context 'check if fetching tags for a notebook is working' do
        before :each do
          Rails.application.load_seed 
        end
        it 'Check for 1 tag' do
          note = Note.where(title:"Sorting Algorithms").first()
          note_tag_list = NotebooksHelper.getTagsForNotebook(note)
          expect(note_tag_list.count).to eq(1)
        end
        it 'Check no tags' do
          note = Note.where(title:"Directed Acyclic Graph").first()
          note_tag_list = NotebooksHelper.getTagsForNotebook(note)
          expect(note_tag_list.count).to eq(0)
        end
      end
    end

    describe 'check if assigning tags is working' do
      context 'Check if assigning the tags to note is working' do
        before :each do
          Rails.application.load_seed 
        end
        it 'Adding 1 tag' do
          note = Note.create(title:"Test",description:"Tag Test")
          NotebooksHelper.setupNotebookTags(note,'sorting')
          note_tag_list = NotebooksHelper.getTagsForNotebook(note)
          expect(note_tag_list.count).to eq(1)
        end
        it 'Adding multiple tags' do
          note = Note.create(title:"Test",description:"Tag Test")
          NotebooksHelper.setupNotebookTags(note,'sorting,graph')
          note_tag_list = NotebooksHelper.getTagsForNotebook(note)
          expect(note_tag_list.count).to eq(2)
        end
      end
    end

  end

  
  describe 'check if notes with filter' do
    context 'check if notes with filter working properly' do
      before :each do
        Rails.application.load_seed 
      end
      it 'What happens if unkown tag is passed' do
        notes = NotebooksHelper.notes_with_filters('',1)
        expect(notes.count).to eq(0)
      end
      it 'What hapens if passed user as nil' do
        notes = NotebooksHelper.notes_with_filters('all_notebooks',nil)
        expect(notes.count).to eq(0)
      end
    end
  end
  
end
