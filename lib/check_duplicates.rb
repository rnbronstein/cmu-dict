class CheckDuplicates
  # include Readable

  def self.all_multiples
    OUTPUT.map do |line|
      multiple?(line)
    end
  end

  private

  def multiple?(line)
    line.split!(" ")
    line[1] =~ /\d/
    binding.pry
  end

end
