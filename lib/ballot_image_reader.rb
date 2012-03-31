require 'ballot_image_vote'

class BallotImageReader
  RANKINGS_PER_VOTER = 3

  def initialize(candidate_list)
    @candidate_list = candidate_list
    calculate_preferences
  end
  
  private

  def source_dir_path
    File.join(SFBP::ROOT, SFBP::SOURCE_DIR_RELATIVE_PATH)
  end

  def ballot_image_glob
    File.join(source_dir_path, '*-BallotImage.txt')
  end
    
  def ballot_image_file_path
    Dir.glob(ballot_image_glob).first
  end

  def calculate_preferences
    File.open(ballot_image_file_path) do |file|
      process_rankings(file)
    end
  end
  
  def process_rankings(file)
    file.each_slice(RANKINGS_PER_VOTER) do |lines|
      # maybe change this to ask, rather than tell?
      BallotImageVote.new(lines, @candidate_list)
    end
  end
end