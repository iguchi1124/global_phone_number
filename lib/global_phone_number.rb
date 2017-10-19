require "ox"
require "global_phone_number/version"
require "global_phone_number/configuration"
require "global_phone_number/metadata"
require "global_phone_number/parser"

module GlobalPhoneNumber
  class << self
    def parse(phone_number)
      parser.parse(phone_number)
    end

    def metadata
      @metadata ||= Metadata.parse(config.metadata_path)
    end

    def configure
      yield config
    end

    def config
      @config ||= Configuration.new
    end

    private

    def parser
      @parser ||= Parser.new(phone_number, metadata)
    end
  end
end
