require 'ballot_image_vote'

class BallotImageReader
  BALLOT_IMAGE_PATH = '*-BallotImage.txt'
  RANKINGS_PER_VOTER = 3

  def initialize(candidate_list)
    @candidate_list = candidate_list
    calculate_preferences
  end
  
  private

  def calculate_preferences
    SFBP.file_from_path(BALLOT_IMAGE_PATH).handle_file do |file|
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