require './lib/candidate'
require './lib/master_lookup'
require './lib/ballot_image_reader'

module SFBP
  ROOT = File.dirname(__FILE__)
  SOURCE_DIR_RELATIVE_PATH = 'spec/fixtures/2012-mayor'
end

class SFBallotParse
  attr_reader :candidates

  def initialize
    calculate_preferences
  end
  
  def print_candidates
    candidates.each do |candidate|
      puts "#{candidate.name}\n"
    end
  end

  def print_matchups
    each_matchup do |subject, opponent|
      puts "#{subject.name} is preferred to #{opponent.name} by #{subject.pref_count(opponent)} voters.\n"
    end
  end

  private

  def candidate_list
    master_lookup.candidate_list
  end

  def candidates
    candidate_list.candidates
  end

  def calculate_preferences
    BallotImageReader.new(candidate_list)
  end

  def each_matchup
    matchups.each do |matchup|
      subject, opponent = matchup
      yield subject, opponent
    end
  end

  def matchups
    @matchups ||= candidates.combinations(2)
  end
  
  def master_lookup
    @master_lookup ||= MasterLookup.new(SFBP::SOURCE_DIR_RELATIVE_PATH)
  end
end