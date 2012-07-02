require 'conductor'

describe Conductor do
  describe '.conduct' do
    it 'prints results for all matchups' do
      checked_lines = []

      $stdout.stub(:puts) do |string|
        checked_lines << string
      end

      Conductor.conduct('spec/fixtures/2012-mayor')

      checked_lines.should include "LELAND YEE is preferred to DAVID CHIU by 1 voter(s).\n"
      checked_lines.should include "LELAND YEE is preferred to EMIL LAWRENCE by 1 voter(s).\n"
      checked_lines.should include "TERRY JOAN BAUM is preferred to WRITE-IN JOHN EDWARD FITCH by 1 voter(s).\n"
    end
  end
end