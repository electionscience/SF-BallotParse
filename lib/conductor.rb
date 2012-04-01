require 'sfbp'
require 'candidate'
require 'master_lookup'
require 'ballot_image_reader'

class Conductor
  attr_reader :candidates

  def print_matchups
    each_matchup do |subject, opponent|
      puts "#{subject.name} is preferred to #{opponent.name} by #{subject.pref_count(opponent)} voters.\n"
    end
  end

  def calculate_preferences
    BallotImageReader.new(candidate_list)
  end

  private

  def candidate_list
    master_lookup.candidate_list
  end

  def candidates
    candidate_list.candidates
  end
  
  def master_lookup
    @master_lookup ||= MasterLookup.new
  end
end