class Parser
  def initialize(mapper, separator = /\t/)
    @mapper = mapper
    @separator = separator
  end

  def parse(input_io)
    file = input_io.open
    headers = headers_of(file)

    file.map do |line|
      initialize_mode_from(headers, line)
    end
  end

  private

  def split(line)
    line.chomp.split(@separator)
  end

  def headers_of(file)
    first_line = split(file.first)
    @mapper.remap(first_line)
  end

  def initialize_mode_from(headers, line)
    inputs = split(line)
    zipped_line = headers.zip(inputs)
    mapped_attributes = Hash[zipped_line]
    @mapper::MODEL.new(mapped_attributes)
  end
end
