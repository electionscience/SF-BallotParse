class CandidateList
  def add(options)
    candidates << Candidate.new(options)
  end
  
  def candidates
    @candidates ||= []
  end
end