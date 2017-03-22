# This class parses each line of an +input_io+ to a list of object models
#
# To initialize this, use a mapper class
# This Mapper class needs respond to a `remap` method which receives the
# first_line of the file and remap this readers to the model attributes,
# and contains a constant named MODEL which specifies the model to be parsed
#
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
