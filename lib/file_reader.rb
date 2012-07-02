class FileReader < Struct.new(:source_directory_path_from_root, :filename)
  def self.process(source_directory_path_from_root, filename, &block)
    new(source_directory_path_from_root, filename).process(&block)
  end

  def process
    File.open(path) { |file| yield file }
  end

  private

  def path
    Dir::glob(glob).first
  end

  def glob
    File.expand_path(unexpanded_glob)
  end

  def unexpanded_glob
    File.join(source_dir_path_from_here, filename)
  end

  def source_dir_path_from_here
    source_directory_path_from_root
  end

  def this_dir
    File.dirname(__FILE__)
  end
end
