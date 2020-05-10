# frozen_string_literal: true

require "test_helper"

module Classes
  class ClassListTest < Minitest::Test
    def test_parse
      assert_equal "a", ClassList.parse("a").to_s
      assert_equal "a", ClassList.parse("a ").to_s
      assert_equal "a", ClassList.parse(" a").to_s
      assert_equal "a b", ClassList.parse("a b").to_s
      assert_equal "a b", ClassList.parse("a  b").to_s
      assert_equal "a b", ClassList.parse("a\nb").to_s
      assert_equal "a b", ClassList.parse(" a  b ").to_s
      assert_equal "", ClassList.parse("").to_s
      assert_equal "", ClassList.parse(" ").to_s
    end

    def test_add_nil
      l = ClassList.new
      l << nil
      assert_equal "", l.to_s
    end

    def test_add_false
      l = ClassList.new
      l << false
      assert_equal "", l.to_s
    end

    def test_add_hash
      l = ClassList.new(["a"])
      l << { "a" => true, "b" => true }
      assert_equal "a b", l.to_s
    end

    def test_add_parse
      l = ClassList.new(["a"])
      l << "a b"
      assert_equal "a b", l.to_s
    end

    def test_add_string
      l = ClassList.new(["a"])
      mock = Minitest::Mock.new
      ClassList.stub :parse, mock do
        l << "a" << "b"
      end
      mock.verify
      assert_equal "a b", l.to_s
    end

    def test_add_empty_string
      l = ClassList.new(["a"])
      l << ""
      assert_equal "a", l.to_s
    end

    def test_add_whitespace_string
      l = ClassList.new(["a"])
      l << " "
      assert_equal "a", l.to_s
    end

    def test_add_symbol
      l = ClassList.new(["a"])
      mock = Minitest::Mock.new
      ClassList.stub :parse, mock do
        l << :a << :b
      end
      mock.verify
      assert_equal "a b", l.to_s
    end

    def test_add_array
      l = ClassList.new(["a"])
      l << ["a", "b"]
      assert_equal "a b", l.to_s
    end

    def test_add_complex
      l = ClassList.new(["a"])
      l << ["a", :b, { c: "true" }, [["d"], "e f"], false]
      assert_equal "a b c d e f", l.to_s
    end
  end
end
