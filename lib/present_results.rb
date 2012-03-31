class PresentResults
  def initialize(candidate_list)
    @candidate_list = candidate_list
  end
  
  def print_matchups
   puts matchup_graph
  end

  private
  
  def matchup_graph
    result = ''
    @candidate_list.each_matchup do |subject, opponent|
      result << "#{subject.name} is preferred to #{opponent.name} by #{subject.pref_count(opponent)} voter(s).\n"
    end
    result
  end
end