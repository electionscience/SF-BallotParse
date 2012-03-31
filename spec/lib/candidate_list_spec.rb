require 'candidate'
require 'candidate_list'

describe CandidateList do
  describe '#matchups' do
    subject {
      list = CandidateList.new
      list.add(candidate_1).add(candidate_2).add(candidate_3)
    }

    let(:candidate_1) { Candidate.new(name: 'Candidate 1') }
    let(:candidate_2) { Candidate.new(name: 'Candidate 2') }
    let(:candidate_3) { Candidate.new(name: 'Candidate 3') }

    it "outputs all combinations of candidates" do
      subject.matchups.should include [candidate_1, candidate_2]
      subject.matchups.should include [candidate_1, candidate_3]
      subject.matchups.should include [candidate_2, candidate_3]
    end
  end
end