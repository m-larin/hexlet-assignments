# frozen_string_literal: true

require 'date'

# BEGIN
module Model
  TRUE_VALUES = [true, 1, '2', 't', 'T', 'true', 'TRUE', 'True', 'on', 'ON'].freeze

  def self.included(base)
    base.class_eval do
      def initialize(attributes = {})
        self.class.attr_info.each do |name, options|
          if options[:default].nil?
            send "#{name}=", nil
          else
            send "#{name}=", options[:default]
          end
        end

        attributes.each do |name, value|
          send "#{name}=", value if self.class.attr_info.keys.include? name
        end
      end

      def self.attr_info
        @attr_info
      end

      def self.attribute(name, options = {})
        @attr_info ||= {}
        @attr_info[name] = options

        # getter
        define_method name do
          instance_variable_get "@#{name}"
        end

        # setter
        define_method "#{name}=" do |value|
          attr_value = if value.nil?
                         nil
                       elsif options[:type] == :datetime
                         DateTime.parse value
                       elsif options[:type] == :integer
                         value.to_i
                       elsif options[:type] == :boolean
                         if Model::TRUE_VALUES.include? value
                           true
                         else
                           false
                         end
                       elsif options[:type] == :string
                         value.to_s
                       else
                         value
                       end

          instance_variable_set "@#{name}", attr_value
        end
      end

      def attributes
        result = {}
        self.class.attr_info.each do |name, _value|
          result[name] = send name
        end
        result
      end
    end
  end
end
# END
