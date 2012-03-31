class BallotImageLine
  CANDIDATE_ID_START_INDEX = 36
  CANDIDATE_ID_LENGTH = 7
  
  def initialize(line, candidate_list)
    @line = line
    @candidate_list = candidate_list
  end

  def record_id
    @line[CANDIDATE_ID_START_INDEX, CANDIDATE_ID_LENGTH]
  end
  
  def candidate
    return nil if record_id == '0000000'
    @candidate_list.find(record_id)
  end
end