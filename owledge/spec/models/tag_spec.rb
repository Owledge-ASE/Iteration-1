require 'rails_helper'

RSpec.describe Tag, type: :model do
  
  describe 'check if fetching tags based on array works' do
    context 'check if fetching tags for a notebook is working' do
      before :each do
        Note.delete_all
        Rails.application.load_seed 
      end
      it 'Check for multiple tags' do
        tags = Tag.searchByTitle(['sorting','graph'])
        expect(tags.count).to eq(2)
      end
      it 'Check for one matching tag' do
        tags = Tag.searchByTitle(['sorting2','graph'])
        expect(tags.count).to eq(1)
      end
      it 'Check for no matching tags' do
        tags = Tag.searchByTitle(['sorting2','graph2'])
        expect(tags.count).to eq(0)
      end
    end
  end
end
