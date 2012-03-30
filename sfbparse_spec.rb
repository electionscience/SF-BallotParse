require 'rspec'
require './sfbparse'

describe SFBallotParse do
  subject { SFBallotParse.new('spec/fixtures/2012-mayor') }

  it 'should work' do
    subject
  end
  
  describe '#candidates' do
    its(:candidates) { should include 'LELAND YEE' }
  end
end