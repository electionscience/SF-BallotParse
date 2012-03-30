require 'rspec'
require './sfbparse'

describe SFBallotParse do
  subject { SFBallotParse.new('spec/fixtures/2012-mayor') }

  it 'should work' do
    subject
  end
  
  describe '#candidates' do
    it 'gets the first candidate' do
      subject.candidates.should include 'LELAND YEE'
    end
    
    it 'gets the last candidate' do
      subject.candidates.should include 'WRITE-IN DAVID VILLA-LOBOS'
    end
    
    it 'processes all candidates, and no other record types' do
      subject.candidates.length.should == 25
    end
  end
  
  describe '#print_candidates' do
    it 'should include all candidates, and no other record types' do
      subject.should_receive(:puts).with("LELAND YEE\n")
      subject.should_receive(:puts).exactly(23).times
      subject.should_receive(:puts).with("WRITE-IN DAVID VILLA-LOBOS\n")
      subject.print_candidates
    end
  end
end