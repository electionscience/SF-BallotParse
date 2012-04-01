require 'rspec'
require 'conductor'

describe Conductor do
  SFBP::SOURCE_DIR_PATH_FROM_ROOT = 'spec/fixtures/2012-mayor'

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
end