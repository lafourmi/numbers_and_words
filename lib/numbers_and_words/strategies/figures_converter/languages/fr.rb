# frozen_string_literal: true

module NumbersAndWords
  module Strategies
    module FiguresConverter
      module Languages
        class Fr < Base
          def capacity_iteration
            words = []
            capacity_words = words_in_capacity(@current_capacity)
            words.push(megs) unless capacity_words.empty?
            words += capacity_words unless thousand? && one?
            words
          end

          def ones
            super(internal_options)
          end
          
          def tens_with_ones
            super(internal_options)
          end

          def hundreds
            super internal_options.merge(pluralize: simple_number_to_words.empty?)
          end

          def megs
            super({ number: @figures.number_in_capacity(@current_capacity) })
          end

          private

          def internal_options
            { gender: gender }
          end

          def one?
            words_in_capacity(@current_capacity) == [translations.ones(1)]
          end

          def thousand?
            FiguresArray::THOUSAND_CAPACITY == @current_capacity
          end
          
          def gender
            options.gender.result
          end
        end
      end
    end
  end
end
