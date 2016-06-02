module LockfilePreserver
  class Pipeline
    def initialize(preservers)
      @preservers = preservers
    end

    def call(original, updated)
      result = updated

      preservers.each do |preserver|
        result = preserver.new(original, result).keep
      end

      result
    end

    private

      attr_reader :preservers
  end
end
