class MasterLookupLine
  RECORD_ID_START_INDEX = 10
  RECORD_ID_LENGTH = 7
  RECORD_DESCRIPTION_START_INDEX = 17
  RECORD_DESCRIPTION_LENGTH = 50

  def initialize(line)
    @line = line
  end
  
  def id
    @line[RECORD_ID_START_INDEX,RECORD_ID_LENGTH]
  end
  
  def description
    @line[RECORD_DESCRIPTION_START_INDEX,RECORD_DESCRIPTION_LENGTH].rstrip
  end
  
  def is_candidate?
    !!@line.match(/^Candidate/)
  end
end