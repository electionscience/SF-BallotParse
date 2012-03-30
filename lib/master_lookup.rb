require 'master_lookup_line'
require 'candidate_list'

class MasterLookup  
  def candidate_list
    @candidate_list ||= File.open(master_lookup) do |file|
      candidates_from_master_lookup(file)
    end
  end

  private

  def candidates_from_master_lookup(file)
    candidate_list = CandidateList.new
    while line = file.gets
      lookup_line = MasterLookupLine.new(line)
      break unless lookup_line.is_candidate?
      candidate_list.add(name: lookup_line.description)
    end
    candidate_list
  end

  def source_dir_path
    File.join(SFBP::ROOT, SFBP::SOURCE_DIR_RELATIVE_PATH)
  end

  def master_lookup_glob
    File.join(source_dir_path, '*-MasterLookup.txt')
  end
    
  def master_lookup
    Dir.glob(master_lookup_glob).first
  end
end