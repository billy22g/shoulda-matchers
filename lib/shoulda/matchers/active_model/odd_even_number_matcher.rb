module Shoulda # :nodoc:
  module Matchers
    module ActiveModel # :nodoc:
      class OddEvenNumberMatcher # :nodoc:
        NON_EVEN_NUMBER_VALUE = 1
        NON_ODD_NUMBER_VALUE  = 2

        def initialize(attribute, odd: true, even: true)
          @attribute = attribute

          if odd && !even
            @disallow_value_matcher = DisallowValueMatcher.new(NON_ODD_NUMBER_VALUE).
              for(@attribute).
              with_message(:odd)
          else
            @disallow_value_matcher = DisallowValueMatcher.new(NON_EVEN_NUMBER_VALUE).
              for(@attribute).
              with_message(:even)
          end
        end

        def matches?(subject)
          @disallow_value_matcher.matches?(subject)
        end

        def with_message(message)
          @disallow_value_matcher.with_message(message)
          self
        end

        def allowed_types
          'integer'
        end

        def failure_message_for_should
          @disallow_value_matcher.failure_message_for_should
        end

        def failure_message_for_should_not
          @disallow_value_matcher.failure_message_for_should_not
        end
      end
    end
  end
end
