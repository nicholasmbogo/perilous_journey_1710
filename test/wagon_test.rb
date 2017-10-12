require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'
require './lib/wagon'

class WagonTest < Minitest::Test
  def test_wagon_exists
    wt = Wagon.new

    assert_instance_of Wagon, wt
  end

  def test_wagon_has_a_list
    wt = Wagon.new

    assert_instance_of LinkedList, wt.list
  end

  def test_linked_list_head_is_nil
    wt = Wagon.new

    assert_nil wt.list.head
  end

  def test_can_append_a_wagon
    wt = Wagon.new
    node = wt.append("Burke", {"pounds of food" => 200})

    assert_instance_of Node, node
  end

  def test_can_append_a_second_wagon
    wt = Wagon.new
    node = wt.append("Burke", {"pounds of food" => 200})
    node1 = wt.append("West", {"pounds of food" => 200})

    assert_instance_of Node, node1
  end

  def test_wagon_has_count
    wt = Wagon.new
    node = wt.append("Burke",{"pounds of food" => 200})
    node1 = wt.append("West", {"pounds of food" => 200})

    assert_equal 2, wt.count
  end

  def test_can_have_supplies_on_wagon
    wt = Wagon.new
    node = wt.append("Burke", {"spare wagon tongues" => 3})
    node1 = wt.append("West", {"pounds of food" => 500})

    assert_equal ({"spare wagon tongues" => 3, "pounds of food" => 500}), wt.supplies
  end

  def test_returns_aggregate_supplies
    wt = Wagon.new
    node = wt.append("Burke", {"pounds of food" => 300})
    node1 = wt.append("West", {"pounds of food" => 500})

    assert_equal ({"pounds of food" => 800}), wt.supplies
    assert_equal 800, wt.supplies["pounds of food"]
  end

end
