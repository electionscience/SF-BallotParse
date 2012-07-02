class AddRankingToCandidateList < Struct.new(:ranking_lines, :candidate_list)
  def self.process(*args)
    new(*args).add_ranking
  end

  def add_ranking
    candidate_list.add_ranking(*ranked_candidates)
  end

  private

  def ranked_candidates
    ranking_lines.map {|ranking_line| BallotImageLine.new(ranking_line, candidate_list).candidate}
  end
end