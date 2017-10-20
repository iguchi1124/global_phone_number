class GlobalPhoneNumber
  class Metadata
    def self.parse(path)
      new(Ox.parse(File.read(path)))
    end

    attr_reader :data

    def initialize(data)
      @data = data
    end

    def territories
      data.root.territories.nodes.select { |node|
        node.value == 'territory'
      }.map { |node|
        Territory.new(node)
      }
    end
  end
end
