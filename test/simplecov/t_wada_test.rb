# frozen_string_literal: true

require 'test_helper'

def SimpleCov.minimum_coverage; end

class SimpleCov::Formatter::TWadaTest < Minitest::Test
  LION    = '(´ε｀ )'
  MESSAGE = 'テスト書こうな'

  def setup
    @formatter = SimpleCov::Formatter::TWada.new
    SimpleCov::Formatter::TWada.aa      = LION
    SimpleCov::Formatter::TWada.message = MESSAGE
  end

  def test_that_it_has_a_version_number
    assert ::SimpleCov::Formatter::TWada::VERSION
  end

  def test_format_with_coverage_percent_above_minimum_coverage
    result_mock = Minitest::Mock.new

    result_mock.expect :created_at,      Time.at(1_503_618_901)
    result_mock.expect :command_name,    'MiniTest'
    result_mock.expect :covered_percent, 99
    result_mock.expect :covered_percent, 99
    result_mock.expect :covered_lines,   100
    result_mock.expect :total_lines,     150

    ::SimpleCov.stub :minimum_coverage, 80 do
      out, err = capture_io do
        @formatter.format(result_mock)
      end

      assert_match 'Coverage report generated for MiniTest.', out
      assert_match '100/150 LOC (99%) covered at 2017-08-25 08:55:01 +0900.', out
      assert_empty err
      refute_match LION,    out
      refute_match MESSAGE, out
    end
  end

  def test_format_with_coverage_percent_bellow_minimum_coverage
    result_mock = Minitest::Mock.new

    result_mock.expect :created_at,      Time.at(1_503_618_901)
    result_mock.expect :command_name,    'MiniTest'
    result_mock.expect :covered_percent, 80
    result_mock.expect :covered_percent, 80
    result_mock.expect :covered_lines,   100
    result_mock.expect :total_lines,     150

    ::SimpleCov.stub :minimum_coverage, 99 do
      out, err = capture_io do
        @formatter.format(result_mock)
      end

      assert_match 'Coverage report generated for MiniTest.', out
      assert_match '100/150 LOC (80%) covered at 2017-08-25 08:55:01 +0900.', out
      assert_empty err
      assert_match LION,    out
      assert_match MESSAGE, out
    end
  end
end
