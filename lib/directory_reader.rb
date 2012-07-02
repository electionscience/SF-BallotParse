class DirectoryReader < Struct.new(:source_directory_path_from_root)
  def file_from_path(source_directory_path_from_root)
    new(source_directory_path_from_root)
  end

  def handle_file(filename, &block)
    FileReader.process(source_directory_path_from_root, filename, &block)
  end
end
