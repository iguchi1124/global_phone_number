class GlobalPhoneNumber
  class Metadata
    class Territory
      def initialize(node)
        @node = node
      end

      def available_formats
        @available_formats ||= @node.nodes.find { |node|
          node.value == 'availableFormats'
        }&.nodes&.select { |node|
          node.value == 'numberFormat'
        }&.map { |node|
          NumberFormat.new(node)
        }
      end

      def id
        @id ||= @node.attributes[:id]
      end

      def country_code
        @country_code ||= @node.attributes[:countryCode]
      end

      def national_prefix
        @national_prefix ||= @node.attributes[:nationalPrefix]
      end
    end
  end
end
