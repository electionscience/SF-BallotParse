BallotImageLine = Struct.new(:line, :candidate_list) do
  def candidate
    return nil if record_id == '0000000'
    candidate_list.find(record_id)
  end

  private

  def record_id
    line[CANDIDATE_ID_START_INDEX, CANDIDATE_ID_LENGTH]
  end
end

BallotImageLine::CANDIDATE_ID_START_INDEX = 36
BallotImageLine::CANDIDATE_ID_LENGTH = 7
