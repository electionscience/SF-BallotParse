class MasterLookupLine
  def initialize(line)
    @line = line
  end
  
  def candidate_name
    @line[17,50].rstrip
  end
  
  def is_candidate?
    !!@line.match(/^Candidate/)
  end
end