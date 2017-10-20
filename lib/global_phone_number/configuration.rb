class GlobalPhoneNumber
  class Configuration
    attr_accessor :metadata_path

    def initialize
      @metadata_path = gem_dir.join('data', 'PhoneNumberMetadata.xml')
    end

    private

    def gem_dir
      @gem_dir ||= Pathname.new Gem::Specification.find_by_name('global_phone_number').gem_dir
    end
  end
end
