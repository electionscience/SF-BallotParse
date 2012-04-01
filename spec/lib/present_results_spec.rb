require 'candidate'
require 'candidate_list'
require 'present_results'

describe PresentResults do
  subject { PresentResults.new(candidate_list) }

  before do
    candidate_1.stub(:pref_count).with(candidate_2).and_return(3)
    candidate_1.stub(:pref_count).with(candidate_3).and_return(5)
    candidate_2.stub(:pref_count).with(candidate_1).and_return(7)
    candidate_2.stub(:pref_count).with(candidate_3).and_return(11)
    candidate_3.stub(:pref_count).with(candidate_1).and_return(13)
    candidate_3.stub(:pref_count).with(candidate_2).and_return(17)
  end
  
  let(:candidate_list) { CandidateList.new.add(candidate_1).add(candidate_2).add(candidate_3) }
  let(:candidate_1) { double('candidate 1', name: 'candidate 1') }
  let(:candidate_2) { double('candidate 2', name: 'candidate 2') }
  let(:candidate_3) { double('candidate 3', name: 'candidate 3') }

  describe '#print_matchups' do
    it "passes a matchup graph to puts" do
      $stdout.should_receive(:puts).with("candidate 1 is preferred to candidate 2 by 3 voter(s).\n")
      $stdout.should_receive(:puts).with("candidate 1 is preferred to candidate 3 by 5 voter(s).\n")
      $stdout.should_receive(:puts).with("candidate 2 is preferred to candidate 1 by 7 voter(s).\n")
      $stdout.should_receive(:puts).with("candidate 2 is preferred to candidate 3 by 11 voter(s).\n")
      $stdout.should_receive(:puts).with("candidate 3 is preferred to candidate 1 by 13 voter(s).\n")
      $stdout.should_receive(:puts).with("candidate 3 is preferred to candidate 2 by 17 voter(s).\n")
      
      subject.print_matchups
    end
  end
end