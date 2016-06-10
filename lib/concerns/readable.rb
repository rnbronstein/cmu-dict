module FileReader

  def read
    file = "cmudict"
    full_dictionary = File.read(file)
    OUTPUT = full_dictionary.lines
  end

end
