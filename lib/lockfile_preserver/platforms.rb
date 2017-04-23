module LockfilePreserver
  class Platforms
    def initialize(original, updated)
      @original = original
      @updated = updated
    end

    def keep
      if original.include? PLATFORMS
        keep_platforms
      else
        remove_platforms
      end
    end

    private

      attr_reader :original, :updated

      PLATFORMS = "PLATFORMS".freeze
      RUBY_PATTERN = %r{.+}
      REGEXP = %r{\n\nPLATFORMS\n\s+(?<ruby>#{RUBY_PATTERN})\n*}
      NEW_LINE = "\n".freeze

      private_constant :PLATFORMS
      private_constant :RUBY_PATTERN
      private_constant :REGEXP
      private_constant :NEW_LINE

      def keep_platforms
        if updated.include? PLATFORMS
          retains_platforms
        else
          add_platforms
        end
      end

      def retains_platforms
        updated.sub(REGEXP, platforms_section)
      end

      def platforms_section
        "\n\nPLATFORMS\n" \
        "  #{platform_ruby}\n\n"
      end

      # How PLATFORMS added to lockfile: https://git.io/vSda6
      def add_platforms
        updated_lines = updated.lines

        # Find last line of GEM
        last_section_of_gem_index = updated.lines.index { |line| line != "G" && line.chr == "\n" }

        # PLATFORMS should be added after GEM section
        add_platforms_index = last_section_of_gem_index + 1

        # Add PLATFORMS section
        updated_lines.insert(
          add_platforms_index, "\nPLATFORMS\n", "  #{platform_ruby}\n"
        )

        # Reconstruct lockfile
        updated_lines.join
      end

      def remove_platforms
        updated.sub(REGEXP, NEW_LINE)
      end

      def platform_ruby
        @_platform_ruby ||= original.match(REGEXP)[:ruby]
      end
  end
end
