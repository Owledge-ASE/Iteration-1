require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'check if Only parents function is working as expected' do
    context 'No records so count is 0' do
      before :each do
        Note.delete_all
      end
      it 'Checks the list of parents' do
        @notes = Note.allParents
        expect(@notes.count).to eq(0)
      end
    end
    context 'Only parents so count of function is equal to count of all' do
      before :each do
        Note.delete_all
        Note.create([{
                              title: 'Graph Theory',
                              description: %w{
                                In mathematics, graph theory is the study of graphs, which are mathematical structures
                                used to model pairwise relations between objects.
                              }.join(" ")
                            }])
        Note.create([{
                              title: 'Sorting Algorithms',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" ")
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 3',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" ")
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 4',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" ")
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 5',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" ")
                            }])
      end
      it 'Checks the list of parents' do
        @notes = Note.allParents
        @notes_all = Note.all
        expect(@notes.count).to eq(@notes_all.count)
      end
    end
    context 'parents and children so counts shouldnt match' do
      before :each do
        Note.delete_all
        @note = Note.create([{
                              title: 'Graph Theory',
                              description: %w{
                                In mathematics, graph theory is the study of graphs, which are mathematical structures
                                used to model pairwise relations between objects.
                              }.join(" ")
                            }])
        @note2 = Note.create([{
                              title: 'Sorting Algorithms',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" ")
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 3',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:@note[0].id
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 4',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:@note[0].id
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 5',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:@note[0].id
                            }])
      end
      it 'Checks the list of parents count is not equal to list count' do
        @notes = Note.allParents
        @notes_all = Note.all
        expect(@notes.count).not_to eq(@notes_all.count)
      end
      it 'Checks the list of parents count is 2' do
        @notes = Note.allParents
        expect(@notes.count).to eq(2)
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
        @note = Note.create([{
                              title: 'Graph Theory',
                              description: %w{
                                In mathematics, graph theory is the study of graphs, which are mathematical structures
                                used to model pairwise relations between objects.
                              }.join(" ")
                            }])
        @note2 = Note.create([{
                              title: 'Sorting Algorithms',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" ")
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 3',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:@note[0].id
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 4',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:@note[0].id
                            }])
        @child_note = Note.create([{
                              title: 'Sorting Algorithms 5',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:@note[0].id
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 6',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:@child_note[0].id
                            }])
      end
      it 'Check non existent record' do
        expect {
          Note.ancestors (8)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
      it 'Check ancestors of a parent' do
          @notes = Note.ancestors (1)
          expect(@notes.count).to eq(1)
      end
      it 'Check ancestors of a child' do
          @notes = Note.ancestors (5)
          expect(@notes.count).to eq(2)
      end
      it 'Check ancestors of a second level child' do
          @notes = Note.ancestors (6)
          expect(@notes.count).to eq(3)
      end
    end
  end

  
  describe 'check if the child function is working' do
    context 'IF records exist in the table then check the children for them' do
      before :each do
        Note.delete_all
        @note = Note.create([{
                              title: 'Graph Theory',
                              description: %w{
                                In mathematics, graph theory is the study of graphs, which are mathematical structures
                                used to model pairwise relations between objects.
                              }.join(" ")
                            }])
        @note2 = Note.create([{
                              title: 'Sorting Algorithms',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" ")
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 3',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:@note[0].id
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 4',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:@note[0].id
                            }])
        @child_note = Note.create([{
                              title: 'Sorting Algorithms 5',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:@note[0].id
                            }])
        Note.create([{
                              title: 'Sorting Algorithms 6',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:@child_note[0].id
                            }])
      end
      it 'Check children of parent notebook' do
        @note = Note.find(1)
        @note_children = @note.children
        expect(@note_children.count).to eq(3)

      end
      it 'Check children of a parent' do
        @note = Note.find(2)
        @note_children = @note.children
        expect(@note_children.count).to eq(0)
      end
      it 'Check children of another child' do
        @note = Note.find(5)
        @note_children = @note.children
        expect(@note_children.count).to eq(1)
      end
    end
  end
end