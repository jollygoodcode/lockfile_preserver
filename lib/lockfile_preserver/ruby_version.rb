module LockfilePreserver
  class RubyVersion
    def initialize(original, updated)
      @original = original
      @updated = updated
    end

    def keep
      if original.include? RUBY_VERSION
        keep_ruby_version
      else
        remove_ruby_version
      end
    end

    private

      attr_reader :original, :updated

      RUBY_VERSION = "RUBY VERSION".freeze
      VERSION_PATTERN = %r{.+}
      REGEXP = %r{\n\nRUBY VERSION\n\s+(?<version>#{VERSION_PATTERN})\n*}
      NEW_LINE = "\n".freeze

      private_constant :RUBY_VERSION
      private_constant :REGEXP
      private_constant :NEW_LINE

      def keep_ruby_version
        updated.sub(REGEXP, ruby_version_section)
      end

      def remove_ruby_version
        updated.sub(REGEXP, NEW_LINE)
      end

      def ruby_version_section
        "\n\nRUBY VERSION\n" \
        "   #{ruby_version}\n"
      end

      def ruby_version
        @_ruby_version ||= original.match(REGEXP)[:version]
      end
  end
end
