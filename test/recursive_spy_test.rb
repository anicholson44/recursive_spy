require 'minitest/autorun'
require './recursive_spy'

class RecursiveSpyTest < Minitest::Test
  def test_recursive_spy_records_method_calls
    spy = RecursiveSpy.new
    spy.foo
    spy.bar
    spy.baz
    assert_equal [:foo, :bar, :baz], spy.calls.keys
  end

  def test_recursive_spy_records_recursive_method_calls
    spy = RecursiveSpy.new
    spy.foo.bar.baz

    assert_equal [:baz], spy.calls[:foo].first.value.calls[:bar].first.value.calls.keys
    assert_equal [:bar], spy.calls[:foo].first.value.calls.keys
    assert_equal [:foo], spy.calls.keys
  end
  
  def test_recursive_spy_records_args_for_invocations
    spy = RecursiveSpy.new
    spy.foo(1)
    spy.foo(2)
    spy.foo(3).bar(1)

    assert_equal [[1],[2], [3]], spy.calls[:foo].map(&:args)
    assert_equal [1], spy.calls[:foo][2].value.calls[:bar].first.args
  end

  def test_recursive_spy_handles_hash_methods
    spy = RecursiveSpy.new
    spy[:foo]
    assert_equal [:[]], spy.calls.keys
    assert_equal [:foo], spy.calls[:[]].first.args
  end
end
