require 'sfbp'
require 'candidate'
require 'master_lookup'
require 'ballot_image_reader'
require 'present_results'

class Conductor
  attr_reader :candidates

  def print_matchups
    present_results.print_matchups
  end

  def calculate_preferences
    BallotImageReader.new(candidate_list)
  end

  private
  
  def present_results
    PresentResults.new(candidate_list)
  end

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