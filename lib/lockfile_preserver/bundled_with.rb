module LockfilePreserver
  class BundledWith
    def initialize(original, updated)
      @original = original
      @updated = updated
    end

    def keep
      if original.include? BUNDLED_WITH
        keep_bundled_with
      else
        remove_bundled_with
      end
    end

    private

      attr_reader :original, :updated

      BUNDLED_WITH = "BUNDLED WITH".freeze
      REGEXP = %r{\nBUNDLED WITH\n\s+(?<version>#{Gem::Version::VERSION_PATTERN})\n*}
      NEW_LINE = "\n".freeze

      private_constant :BUNDLED_WITH
      private_constant :REGEXP
      private_constant :NEW_LINE

      def keep_bundled_with
        updated.sub(REGEXP, bundled_with)
      end

      def remove_bundled_with
        updated.sub(REGEXP, NEW_LINE)
      end

      def bundled_with
        "\n\nBUNDLED WITH\n" \
        "   #{bundler_version}\n"
      end

      def bundler_version
        @_bundler_version ||= original.match(REGEXP)[:version]
      end
  end
end
