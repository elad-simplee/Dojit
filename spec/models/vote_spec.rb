require 'rails_helper'

describe Vote do
  include TestFactories

  describe "validations" do
    before do 
      @vote_true = Vote.new(value: 1)
      @vote_false = Vote.new(value: -1)
      @invalid_vote = Vote.new(value: 2)
    end
    
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(@vote_true.valid?).to eq true
        expect(@vote_false.valid?).to eq true
        expect(@invalid_vote.valid?).to eq false
      end
    end

    describe 'after_save' do
      it "calls 'post#update_rank' after save" do
        post = associated_post
        vote = @vote_true
        expect(post).to receive(:update_rank)
        vote.save
      end
    end

  end
end