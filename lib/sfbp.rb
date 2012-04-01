module SFBP
  class << self
    def file_from_path(filename)
      FileFromPath.new(filename)
    end
  end
end

class SFBP::FileFromPath
  def initialize(filename)
    @filename = filename
  end
  
  def handle_file
    File.open(path) { |file| yield file }
  end

  private
  
  def path
    Dir.glob(glob).first
  end
  
  def glob
    File.expand_path(unexpanded_glob)
  end

  def unexpanded_glob
    File.join(source_dir_path_from_here, @filename)
  end

  def source_dir_path_from_here
    File.join(this_dir, '../', SFBP::SOURCE_DIR_PATH_FROM_ROOT)
  end
  
  def this_dir
    File.dirname(__FILE__)
  end
end