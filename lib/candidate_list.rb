class CandidateList
  CANDIDATES_PER_MATCHUP = 2
  def add(candidate)
    candidates << candidate
    self
  end
  
  def add_ranking(first, second, third)
    new_ranking_tabulator.add_ranking(first, second, third)
  end
  
  def candidates
    @candidates ||= []
  end
  
  def find(candidate_id)
    candidate = candidates.find {|candidate| candidate.id == candidate_id}
    raise IndexError, "Candidate ID #{candidate_id} not found" unless candidate
    candidate
  end

  def matchups
    candidates.combination(CANDIDATES_PER_MATCHUP)
  end

  private
  
  def new_ranking_tabulator
    RankingTabulator.new(self)
  end
end

class CandidateList::RankingTabulator
  def initialize(candidate_list)
    @candidate_list = candidate_list
  end
  
  def add_ranking(first, second, third)
    [first, second, third].uniq.each do |candidate|
      next if candidate.nil?
      remove(candidate)
      prefer_to_opponents(candidate)
    end
  end

  private

  def prefer_to_opponents(candidate)
    @potential_opponents.each do |opponent|
      candidate.is_preferred_to(opponent)
    end
  end
  
  def remove(candidate)
    potential_opponents.delete(candidate)
  end

  def potential_opponents
    @potential_opponents ||= @candidate_list.candidates.dup
  end
end