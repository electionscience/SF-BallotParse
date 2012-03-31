require 'candidate'
require 'candidate_list'

describe CandidateList do
  describe '#matchups' do
    subject {
      list = CandidateList.new
      list.add(candidate1).add(candidate2).add(candidate3)
    }

    let(:candidate1) { Candidate.new(name: 'Candidate 1') }
    let(:candidate2) { Candidate.new(name: 'Candidate 2') }
    let(:candidate3) { Candidate.new(name: 'Candidate 3') }

    it "outputs all combinations of candidates" do
      subject.matchups.should include [candidate1, candidate2]
      subject.matchups.should include [candidate1, candidate3]
      subject.matchups.should include [candidate2, candidate3]
    end
  end
end