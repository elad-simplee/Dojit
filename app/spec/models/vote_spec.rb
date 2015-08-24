describe Vote do
  describe "validations" do
        before do 
          @vote_true = Vote.new(value: 1)
          @vote_false = Vote.new(value: -1)
          @invalid_vote = Vote.new(value: 2)

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(@vote_true.valid?).to eq true
        expect(@vote_false.valid?).to eq true
        expect(@invalid_vote.valid?).to eq false
      end
    end
  end
end