require 'rails_helper'

RSpec.describe Note, type: :model do
  @note_list_only_parents = [{
    title: 'Sorting Algorithms',
    description: %w{
      In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
    }.join(" ")
  },{
    title: 'Graph Theory',
    description: %w{
      In mathematics, graph theory is the study of graphs, which are mathematical structures
      used to model pairwise relations between objects.
    }.join(" ")
  }]
  describe 'check if Only parents function is working as expected' do
    context 'No records so count is 0' do
      before :each do
        Note.delete_all
      end
      it 'Checks the list of parents' do
        @notes = Note.all_parents
        expect(@notes.count).to eq(0)
      end
    end
    context 'Only parents so count of function is equal to count of all' do
      before :each do
        Note.delete_all
        Note.create(@note_list_only_parents)
      end
      it 'Checks the list of parents' do
        @notes = Note.all_parents
        @notes_all = Note.all
        expect(@notes.count).to eq(@notes_all.count)
      end
    end
    context 'parents and children so counts shouldnt match' do
      before :each do
        Note.delete_all
        Rails.application.load_seed 
      end
      it 'Checks the list of parents count is not equal to list count' do
        @notes = Note.all_parents
        @notes_all = Note.all
        expect(@notes.count).not_to eq(@notes_all.count)
      end
      it 'Checks the list of parents count is 2' do
        @notes = Note.all_parents
        expect(@notes.count).to eq(2)
      end
    end
  end

  describe 'check if search function is working' do
    context 'Check search function return the expected node with titles contain keywords' do
      before :each do
        Note.delete_all
        Rails.application.load_seed  
      end
      it "search graph, will only get two node" do
        @notes = Note.search("Graph")
        expect(@notes.count).to eq(2)
      end
      it "search sort, will only get 5 node" do
        @notes = Note.search("sort")
        content = "sort"
        @search = Note.where('title LIKE ?', "%#{content}%")
        expect(@notes.count).to eq(@search.count) 
      end
      it "search sort, will not equal to number of all node" do
        @allNotes = Note.all
        @notes = Note.search("sort")
        expect(@notes.count).not_to eq(@allNotes.count)
      end
      end
    end

  describe 'check if the ancestors function is working' do
    context 'No records so ancestors should return an error' do
      before :each do
        Note.delete_all
      end
      it 'No records so ancestors should return an error' do
          expect {
            Note.ancestors (1)
          }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
    context 'IF records exist in the table then check ancestors' do
      before :each do
        Note.delete_all
        Rails.application.load_seed 

      end
      it 'Check non existent record' do
        expect {
          Note.ancestors (8)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
      it 'Check ancestors of a parent' do
          @notes = Note.ancestors (Note.find_by_title("Sorting Algorithms").id)
          expect(@notes.count).to eq(1)
      end
      it 'Check ancestors of a child' do
          @notes = Note.ancestors (Note.find_by_title("Sorting Algorithms 3").id)
          expect(@notes.count).to eq(2)
      end
      it 'Check ancestors of a second level child' do
          @notes = Note.ancestors (Note.find_by_title("Sorting Algorithms 6").id)
          expect(@notes.count).to eq(3)
      end
    end
  end

  
  describe 'check if the child function is working' do
    context 'IF records exist in the table then check the children for them' do
      before :each do
        Note.delete_all
        Rails.application.load_seed 
      end
      it 'Check children of parent notebook' do
        @note = Note.find(Note.find_by_title("Sorting Algorithms").id)
        @note_children = @note.children
        expect(@note_children.count).to eq(3)

      end
      it 'Check children of a parent' do
        @note = Note.find(Note.find_by_title("Graph Theory").id)
        @note_children = @note.children
        expect(@note_children.count).to eq(1)
      end
      it 'Check children of another child' do
        @note = Note.find(Note.find_by_title("Sorting Algorithms 5").id)
        @note_children = @note.children
        expect(@note_children.count).to eq(1)
      end
      it 'Check children of child without children' do
        @note = Note.find(Note.find_by_title("Sorting Algorithms 3").id)
        @note_children = @note.children
        expect(@note_children.count).to eq(0)
      end
      it 'Check children of second level child without children' do
        @note = Note.find(Note.find_by_title("Sorting Algorithms 6").id)
        @note_children = @note.children
        expect(@note_children.count).to eq(0)
      end
    end
  end
  
  describe 'check if the sort function is working' do
    context 'Check sort based on specific columns' do
      before :each do
        Note.delete_all
        Rails.application.load_seed 
      end
      it 'Sort on all parents count is same' do
        @notes = Note.all_parents
        @note_sorted = @notes.sort_by_column("title-desc")
        expect(@note_sorted.count).to eq(@notes.count)

      end
      it 'IF no column passed then throw an error' do
        @notes = Note.all_parents
        expect {
          @note_sorted = @notes.sort_by_column()
        }.to raise_error(ArgumentError)
      end
      it 'IF invalid column passed then throw an error' do
        @notes = Note.all_parents
        @note_sorted = @notes.sort_by_column("abc-desc")
      end
      it 'Sort on all parents check title desc order' do
        @notes = Note.all_parents
        @note_sorted = @notes.sort_by_column("title-desc")
        @flag = 0
        for @note in @note_sorted
          if @flag == 0
            @flag = 1
            @prev_note = @note
            next
          end
          expect(@prev_note.title).to be >= (@note.title)
          @prev_note = @note
        end
      end
      it 'Sort on all parents check title asc order' do
        @notes = Note.all_parents
        @note_sorted = @notes.sort_by_column("title-asc")
        @flag = 0
        for @note in @note_sorted
          if @flag == 0
            @flag = 1
            @prev_note = @note
            next
          end
          expect(@prev_note.title).to be <= (@note.title)
          @prev_note = @note
        end
      end
    end
  end

  describe 'check if the likes function is working'
  context 'check likes count based on a specific note_id' do
    before :each do
      Note.delete_all
      Rails.application.load_seed
    end
    it 'Check likes count of a note without any user reactions' do
      @note = Note.find(Note.find_by_title("Sorting Algorithms 6").id)
      count = @note.likes
      expect(count).to eq(0)

    end
    it 'Number of likes for a note for a user is correct' do
      note = Note.find(Note.find_by_title("Sorting Algorithms").id)
      user = User.find(User.find_by_email("apeterson@fakeu.edu").id)
      reaction = UserReaction.where(note_id:note.id,user_id:user.id).first()
      count = note.likes
      expect(count).to eq(1)
    end
    it 'IF invalid note passed then expect count to be 0' do
      # Trying to get the count of an invalid note_id
       count_likes = UserReaction.where(note_id: 101).count
       expect(count_likes).to eq(0)
    end
  end
end