module GlobalPhoneNumber
  class Metadata
    def self.parse(path)
      Ox.default_options = { with_dtd: true }
      new(Ox.parse(File.new(path)))
    end

    attr_reader :data

    def initialize(data)
      @data = data
    end

    def root
      data.root
    end
  end
end
