class PresentResults
  def initialize(candidate_list)
    @candidate_list = candidate_list
  end
  
  def print_matchups
    @candidate_list.each_matchup do |subject, opponent|
      puts "#{subject.name} is preferred to #{opponent.name} by #{subject.pref_count(opponent)} voter(s).\n"
    end
  end
end