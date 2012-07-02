class BallotImageReader < Struct.new(:candidate_list, :directory_reader)
  BALLOT_IMAGE_PATH = '*-BallotImage.txt'
  RANKINGS_PER_VOTER = 3

  def self.process(*args)
    new(*args).process
  end

  def process
    calculate_preferences
  end
  
  private

  def calculate_preferences
    directory_reader.handle_file(BALLOT_IMAGE_PATH) do |file|
      process_rankings(file)
    end
  end
  
  def process_rankings(file)
    file.each_slice(RANKINGS_PER_VOTER) do |lines|
      AddRankingToCandidateList.process(lines, candidate_list)
    end
  end
end