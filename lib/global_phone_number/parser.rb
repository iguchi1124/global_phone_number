class GlobalPhoneNumber
  class Parser
    attr_reader :metadata

    def initialize(metadata)
      @metadata = metadata
    end

    def parse(phone_number, country_code: nil, country_id: nil)
      territories =
        if country_id
          metadata.territories.select { |territory| territory.id == country_id }
        elsif country_code
          metadata.territories.select { |territory| territory.country_code == country_code }
        else
          metadata.territories.select { |territory| phone_number.start_with? territory.country_code }
        end

      territories.each { |territory|
        country_code = territory.country_code
        next unless territory.available_formats
        national_number = phone_number.gsub(/\A#{country_code}/, '')
        national_number = national_number.gsub(/\A#{territory.national_prefix}/, '')
        result = territory.available_formats.any? { |format|
          format.leading_digits.any? { |pattern| national_number.match?(pattern) } &&
            national_number.match?(format.pattern)
        }

        if result
          return GlobalPhoneNumber.new(country_code, national_number)
        end
      }

      nil
    end
  end
end
