# frozen_string_literal: true

require 'simplecov/t_wada/version'

module SimpleCov
  module Formatter
    class TWada
      @@aa = <<~AA
         ^^^^^^^^^^^^^
        <  (´・ω・`)  >
         vvvvvvvvvvvvv
      AA

      @@message = <<~MSG
        --------------------------------
        | テスト書いてないとかお前それ |
        | @t_wadaの前でも              |
        | 同じこと言えんの？           |
        --------------------------------
      MSG

      class << self
        %i[aa message].each do |method|
          class_eval <<-EOS
            def #{method}=(arg)
              @@#{method} = arg
            end
          EOS
        end
      end

      def format(result)
        puts <<~STD
          Coverage report generated for #{result.command_name}.
          #{result.covered_lines}/#{result.total_lines} LOC (#{result.covered_percent}%) covered at #{result.created_at}.
        STD

        return if result.covered_percent >= (::SimpleCov.minimum_coverage || 0)

        puts <<~EOL
          #{@@aa}
          #{@@message}
				EOL
      end
    end
  end
end
