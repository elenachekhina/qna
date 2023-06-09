# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:user) { create(:user) }
  let!(:author) { create(:user) }
  let!(:votable) { create(:question, author: author) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:votable) }

  describe '#save_or_update' do
    context 'when the vote is not persisted' do
      let(:vote) { build(:vote, user: user, votable: votable) }

      it 'saves the vote' do
        expect { vote.save_or_update }.to change(Vote, :count).by(1)
      end
    end

    context 'when the vote is persisted and voice is different' do
      let!(:vote) { create(:vote, user: user, votable: votable, voice: 1) }

      it 'updates the vote' do
        vote.extra_data = { voice: -1 }
        expect { vote.save_or_update }.to change { vote.reload.voice }.to(-1)
      end
    end

    context 'when the vote is persisted and voice is the same' do
      let!(:vote) { create(:vote, user: user, votable: votable, voice: 1) }

      it 'destroys the vote' do
        vote.extra_data = { voice: 1 }
        expect { vote.save_or_update }.to change(Vote, :count).by(-1)
      end
    end
  end
end
