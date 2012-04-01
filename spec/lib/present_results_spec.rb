require 'candidate'
require 'candidate_list'
require 'present_results'

describe PresentResults do
  subject { PresentResults.new(candidate_list) }
  before do
    candidate_1.stub(:pref_count).with(candidate_2).and_return(3)
    candidate_1.stub(:pref_count).with(candidate_3).and_return(5)
    candidate_2.stub(:pref_count).with(candidate_3).and_return(7)
  end
  
  let(:candidate_list) { CandidateList.new.add(candidate_1).add(candidate_2).add(candidate_3) }
  let(:candidate_1) { double(name: 'candidate 1') }
  let(:candidate_2) { double(name: 'candidate 2') }
  let(:candidate_3) { double(name: 'candidate 3') }

  describe '#print_matchups' do
    it "passes a matchup graph to puts" do
      graph = nil
      subject.stub(:puts) { |text| graph = text }
      subject.print_matchups
      graph.should_not be_nil
      graph.should include "candidate 1 is preferred to candidate 2 by 3 voter(s)."
      graph.should include "candidate 1 is preferred to candidate 3 by 5 voter(s)."
      graph.should include "candidate 2 is preferred to candidate 3 by 7 voter(s)."
    end
  end
end