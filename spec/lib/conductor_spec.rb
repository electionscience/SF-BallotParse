require 'conductor'

describe Conductor do
  SFBP::SOURCE_DIR_PATH_FROM_ROOT = 'spec/fixtures/2012-mayor'

  def get_candidate_by_name(name)
    subject.send(:candidates).find {|candidate| candidate.name == name }
  end

  describe '#calculate_preferences' do
    it 'sets the preference counts' do
      avalos = get_candidate_by_name('JOHN AVALOS')
      yee = get_candidate_by_name('LELAND YEE')
      chiu = get_candidate_by_name('DAVID CHIU')
      lee = get_candidate_by_name('ED LEE')

      subject.calculate_preferences

      avalos.pref_count(yee).should == 1
      avalos.pref_count(chiu).should == 1
      lee.pref_count(yee).should == 1
      yee.pref_count(lee).should == 0
      yee.pref_count(chiu).should == 1
    end
  end
  
  describe '#print_matchups' do
    before do
      subject.calculate_preferences
    end

    it 'prints results for all matchups' do
      checked_lines = [
        ["JOHN AVALOS", "LELAND YEE", 1],
        ["JOHN AVALOS", "DAVID CHIU", 1]
      ].map do |subject, opponent, pref_count|
        "#{subject} is preferred to #{opponent} by #{pref_count} voter(s).\n"
      end

      $stdout.stub(:puts) do |string|
        checked_lines -= [string]
      end
      subject.print_matchups
      
      checked_lines.should be_empty
    end
  end
end