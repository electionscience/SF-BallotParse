require 'master_lookup_line'

class MasterLookup
  def initialize(source_dir_relative_path)
    @source_dir_relative_path = source_dir_relative_path
  end
  
  def candidates
    @candidates ||= File.open(master_lookup) do |file|
      candidates_from_master_lookup(file)
    end
  end

  private

  def candidates_from_master_lookup(file)
    result = []
    while line = file.gets
      lookup_line = MasterLookupLine.new(line)
      break unless lookup_line.is_candidate?
      result << lookup_line.description
    end
    result
  end

  def source_dir_path
    File.join(SFBP::ROOT, @source_dir_relative_path)
  end

  def master_lookup_glob
    File.join(source_dir_path, '*-MasterLookup.txt')
  end
    
  def master_lookup
    Dir.glob(master_lookup_glob).first
  end
end