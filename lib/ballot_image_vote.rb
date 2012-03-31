require 'ballot_image_line'

class BallotImageVote
  def initialize(ranking_lines, candidate_list)
    @first_line = BallotImageLine.new(ranking_lines[0], candidate_list)
    @second_line = BallotImageLine.new(ranking_lines[1], candidate_list)
    @third_line = BallotImageLine.new(ranking_lines[2], candidate_list)
    
    @candidate_list = candidate_list
    add_ranking
  end
  
  private
  
  def add_ranking
    @candidate_list.add_ranking(*ranked_candidates)
  end

  def ranked_candidates
    [@first_line.candidate, @second_line.candidate, @third_line.candidate]
  end
end