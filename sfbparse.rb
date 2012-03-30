class SFBallotParse
  attr_reader :candidates

  def initialize(source_dir_relative_path)
    @source_dir_relative_path = source_dir_relative_path
    set_candidates
  end
  
  private
  
  def set_candidates
    @candidates = read_candidates
  end

  def read_candidates
    File.open(master_lookup) do |file|
      result = []
      while (line = MasterLookupLine.new(file.gets)) && line.is_candidate?
        result << line.candidate_name
      end
      result
    end
  end

  def this_dir
    File.dirname(__FILE__)
  end

  def source_dir_path
    File.join(this_dir, @source_dir_relative_path)
  end

  def master_lookup_glob
    File.join(source_dir_path, '*-MasterLookup.txt')
  end
    
  def master_lookup
    Dir.glob(master_lookup_glob).first
  end
end

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