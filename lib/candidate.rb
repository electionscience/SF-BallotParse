class Candidate
  attr_reader :name

  def initialize(options = {})
    @name = options[:name]
    @pref_counts = Hash.new(0)
  end

  def is_preferred_to(opponent)
    @pref_counts[opponent] += 1
  end

  def pref_count(opponent)
    @pref_counts[opponent]
  end
end