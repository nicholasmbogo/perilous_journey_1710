class Wagon

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(surname, supplies)
    @list.append(surname, supplies)
  end

  def count
    @list.count
  end

  def supplies
    supply_list = {}

    current_node = @list.head
    while current_node
      new_supplies = current_node.supplies
      supply_list.merge!(new_supplies) { |key, v1, v2| v1 + v2 }
      current_node = current_node.next_node
    end
    supply_list
  end
end
