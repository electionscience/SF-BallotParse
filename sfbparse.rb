require './lib/master_lookup'

module SFBP
  ROOT = File.dirname(__FILE__)
end

class SFBallotParse
  attr_reader :candidates

  def initialize(source_dir_relative_path)
    @source_dir_relative_path = source_dir_relative_path
    @master_lookup = MasterLookup.new(@source_dir_relative_path)
    set_candidates
  end
  
  def print_candidates
    @candidates.each do |candidate|
      puts "#{candidate}\n"
    end
  end

  private
  
  def set_candidates
    @candidates = @master_lookup.candidates
  end
end