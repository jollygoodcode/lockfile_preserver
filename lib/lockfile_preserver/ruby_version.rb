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
        if updated.include? RUBY_VERSION
          retains_ruby_version
        else
          add_ruby_version
        end
      end

      def retains_ruby_version
        updated.sub(REGEXP, ruby_version_section)
      end

      # How RUBY VERSION added to lockfile: https://git.io/voWNN
      def add_ruby_version
        updated_lines = updated.lines

        # Find BUNDLED WITH line
        bundled_with_index = updated.lines.index { |line| line.include? "BUNDLED WITH" }

        # RUBY VERSION should be added before BUNDLED WITH
        add_ruby_version_index = bundled_with_index-1

        # Find where to add RUBY VERSION section
        while updated_lines[add_ruby_version_index] != "\n"
          add_ruby_version_index -= 1
        end

        # Add RUBY VERSION section
        updated_lines.insert(
          add_ruby_version_index, "\nRUBY VERSION\n", "   #{ruby_version}\n"
        )

        # Reconstruct lockfile
        updated_lines.join
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
