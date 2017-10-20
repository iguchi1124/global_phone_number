class GlobalPhoneNumber
  class Metadata
    class Territory
      class NumberFormat
        def initialize(node)
          @node = node
        end

        def pattern
          @pattern ||= /\A#{@node.attributes[:pattern]}\z/
        end

        def leading_digits
          @leading_digits ||= @node.nodes.select { |node|
            node.value == 'leadingDigits'
          }.map { |node|
            /\A#{node.nodes.first}/x
          }
        end
      end
    end
  end
end
