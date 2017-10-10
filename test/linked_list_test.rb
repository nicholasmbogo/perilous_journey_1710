require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'

class LinkedListTest < Minitest::Test

  def test_linked_list_exist
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_head_is_nil_by_default
    list = LinkedList.new

    assert_nil list.head
  end

  def test_can_append_first_node
    list = LinkedList.new
    family = list.append("West")

    assert_equal "West", family.surname
    assert_nil list.head.next_node
  end

  def test_linked_list_count_is_zero
    list = LinkedList.new

    assert_equal 0, list.count
  end

  def test_linked_list_count_is_one
    list = LinkedList.new
    list.append("West")

    assert_equal 1, list.count
  end

  def test_to_string_returns_family
    list = LinkedList.new
    list.append("West")

    assert_equal "The West family", list.to_string
  end

  def test_list_can_add_a_second_family
    list = LinkedList.new
    list.append("Rhodes")
    second_family = list.append("Hardy")

    assert_equal "Hardy", second_family.surname
    assert_equal second_family, list.head.next_node
  end

  def test_list_can_add_a_third_family
    list = LinkedList.new
    list.append("Rhodes")
    second_family = list.append("Hardy")
    third_family = list.append("Nick")

    assert_equal "Nick", third_family.surname
    assert_equal third_family,     list.head.next_node.next_node
  end

  def test_linked_list_count_is_two
    list = LinkedList.new
    list.append("West")
    list.append("Nick")

    assert_equal 2, list.count
  end

  def test_to_string_returns_multiple_families
    list = LinkedList.new
    list.append("West")
    list.append("Nick")

    assert_equal "The West family, followed by the Nick family", list.to_string
  end

  def test_can_add_a_fourth_family
    list = LinkedList.new
    list.append("West")
    second_family = list.append("Rhodes")
    third_family = list.append("Nick")
    fourth_family = list.append("Brooks")

    assert_equal "Brooks", fourth_family.surname
    assert_equal fourth_family, list.head.next_node.next_node.next_node
  end

  def test_can_prepend_a_node_to_begging_of_list
    list = LinkedList.new
    list.append("Nick")
    list.append("Brooks")

    assert_equal "The Nick family, followed by the Brooks family", list.to_string
    list.prepend("McKinney")
    assert_equal "McKinney", list.head.surname
    assert_equal "The McKinney family, followed by the Nick family, followed by the Brooks family", list.to_string
  end

  def test_linked_list_count_is_three
    list = LinkedList.new
    list.append("McKinney")
    list.append("Nick")
    list.append("Brooks")

    assert_instance_of Node, list.head.next_node.next_node
    assert_equal 3, list.count
  end


  # def test_last_node_returns_the_last_node
  #   list = LinkedList.new
  #   list.append("Nick")
  #   list.append("Brooks")
  #
  #   #assert_equal "The Nick family, followed by the Brooks family", list.to_string
  #   #list.prepend("McKinney")
  #   #binding.pry
  #   assert_equal "Brooks", list.last_node.surname
  # end
  def test_can_insert_a_node_into_position_on_list
    list = LinkedList.new
    list.append("McKinney")
    list.append("Brooks")
    list.insert(1, "Lawson")

    assert_equal "Lawson", list.head.next_node.surname
    assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family", list.to_string
  end

  def test_can_find_and_return_one_family
    list = LinkedList.new
    list.append("McKinney")
    list.append("Brooks")
    list.append("Lawson")

    assert_equal "The Brooks family", list.find(1, 1)
  end

  def test_can_find_and_return_two_family
    list = LinkedList.new
    list.append("McKinney")
    list.append("Brooks")
    list.append("Lawson")
    list.append("Lawson")


    assert_equal "The Lawson family", list.find(2, 1)
  end


  def test_can_find_and_return_three_family
    list = LinkedList.new
    list.append("McKinney")
    list.append("Nick")
    list.append("Brooks")
    list.append("Lawson")

    assert_equal "The Nick family, followed by Brooks family, followed by Lawson family", list.find(1, 3)
  end

  def test_can_return_true_when_list_include_family
    list = LinkedList.new
    list.append("McKinney")
    list.append("Nick")
    list.append("Brooks")
    list.append("Lawson")

    assert_equal true, list.include?("Brooks")
  end

  def test_can_return_false_when_list_include_family
    list = LinkedList.new
    list.append("McKinney")
    list.append("Nick")
    list.append("Brooks")
    list.append("Lawson")

    assert_equal false, list.include?("Chapman")
  end

  def test_can_pops_last_family
    list = LinkedList.new
    list.append("McKinney")
    list.append("Nick")
    list.append("Brooks")
    list.append("Lawson")
    popped = list.pop

    assert_equal 3, list.count
    assert_instance_of Node, popped
    assert_equal "Lawson", popped.surname
  end

  def test_can_pops_last_family
    list = LinkedList.new
    list.append("McKinney")
    list.append("Nick")
    list.append("Brooks")
    popped = list.pop
    assert_equal 2, list.count
    assert_instance_of Node, popped
    assert_equal "Brooks", popped.surname
    assert_equal "The McKinney family, followed by the Nick family", list.to_string
  end
end
