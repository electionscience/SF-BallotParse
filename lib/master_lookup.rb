class MasterLookup < Struct.new(:directory_reader)
  MASTER_LOOKUP_PATH = '*-MasterLookup.txt'

  def candidate_list
    @candidate_list ||= directory_reader.handle_file(MASTER_LOOKUP_PATH) do |file|
      candidates_from_master_lookup(file)
    end
  end

  private

  def candidates_from_master_lookup(file)
    candidate_list = CandidateList.new
    while line = file.gets
      lookup_line = MasterLookupLine.new(line)
      break unless lookup_line.is_candidate?
      candidate_list.add(Candidate.new(name: lookup_line.description, id: lookup_line.id))
    end
    candidate_list
  end
end