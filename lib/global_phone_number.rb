require 'global_phone_number/configuration'
require 'global_phone_number/metadata'
require 'global_phone_number/metadata/territory'
require 'global_phone_number/metadata/territory/number_format'
require 'global_phone_number/parser'
require 'global_phone_number/version'
require 'ox'

class GlobalPhoneNumber
  class << self
    def parse(phone_number, country_code: nil, country_id: nil)
      parser.parse(phone_number, country_code: country_code, country_id: country_id)
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
      @parser ||= Parser.new(metadata)
    end
  end

  attr_reader :country_code, :national_number

  def initialize(country_code, national_number)
    @country_code = country_code
    @national_number = national_number
  end
end
