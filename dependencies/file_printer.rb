class FilePrinter

  def self.new(file_name)
    @file_name = file_name
    return [:file, @file_name]
  end

end
