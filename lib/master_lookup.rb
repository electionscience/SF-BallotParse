require 'master_lookup_line'
require 'candidate_list'

class MasterLookup
  MASTER_LOOKUP_PATH = '*-MasterLookup.txt'

  def candidate_list
    @candidate_list ||= SFBP.file_from_path(MASTER_LOOKUP_PATH).handle_file do |file|
      candidates_from_master_lookup(file)
    end
  end

  private

  def candidates_from_master_lookup(file)
    candidate_list = CandidateList.new
    line_count = 0
    while line = file.gets
      lookup_line = MasterLookupLine.new(line)
      break unless lookup_line.is_candidate?
      candidate_list.add(Candidate.new(name: lookup_line.description, id: lookup_line.id))
    end
    candidate_list
  end
end