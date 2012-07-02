require File.join(File.dirname(__FILE__), 'file_reader')
require File.join(File.dirname(__FILE__), 'directory_reader')
require File.join(File.dirname(__FILE__), 'candidate')
require File.join(File.dirname(__FILE__), 'candidate_list')
require File.join(File.dirname(__FILE__), 'master_lookup_line')
require File.join(File.dirname(__FILE__), 'master_lookup')
require File.join(File.dirname(__FILE__), 'ballot_image_line')
require File.join(File.dirname(__FILE__), 'add_ranking_to_candidate_list')
require File.join(File.dirname(__FILE__), 'ballot_image_reader')
require File.join(File.dirname(__FILE__), 'present_results')

class Conductor < Struct.new(:source_directory_path_from_root)
  attr_reader :candidates

  def self.conduct(source_dir_path_from_root)
    new(source_dir_path_from_root).conduct
  end

  def conduct
    calculate_preferences
    print_matchups
  end

  def calculate_preferences
    BallotImageReader.process(candidate_list, directory_reader)
  end

  private

  def print_matchups
    present_results.print_matchups
  end

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
    @master_lookup ||= MasterLookup.new(directory_reader)
  end

  def directory_reader
    @directory_reader ||= DirectoryReader.new(source_directory_path_from_root)
  end
end