module FileReader

  OUTPUT = read

  def read
    file = "cmudict"
    full_dictionary = File.read(file)
    full_dictionary.lines
  end

end
