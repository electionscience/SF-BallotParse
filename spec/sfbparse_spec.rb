require 'rspec'
require './sfbparse'

describe SFBallotParse do
  def get_candidate_by_name(name)
    subject.send(:candidates).find {|candidate| candidate.name == name }
  end

  describe '#calculate_preferences' do
    it "sets the preference counts" do
      avalos = get_candidate_by_name('JOHN AVALOS')
      yee = get_candidate_by_name('LELAND YEE')
      chiu = get_candidate_by_name('DAVID CHIU')
      lee = get_candidate_by_name('ED LEE')

      avalos.pref_count(yee).should == 1
      avalos.pref_count(chiu).should == 1
      lee.pref_count(yee).should == 1
      yee.pref_count(lee).should == 0
      yee.pref_count(chiu).should == 1
    end
  end
  
  describe '#print_candidates' do
    xit 'includes all candidates, and no other record types' do
      subject.should_receive(:puts).with("LELAND YEE\n")
      subject.should_receive(:puts).exactly(23).times
      subject.should_receive(:puts).with("WRITE-IN DAVID VILLA-LOBOS\n")
      subject.print_candidates
    end
  end
  
  describe '#print_matchups' do
    xit 'prints the number of times each candidate was preferred to each opponent' do
      subject.should_receive(:puts).
        with("JOHN AVALOS is preferred to DAVID CHIU by 1 voter(s).")
    end
  end
end