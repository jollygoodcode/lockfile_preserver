RSpec.describe LockfilePreserver::BundledWith do
  describe "#keep" do
    def exercise(original, updated)
      described_class.new(original, updated).keep
    end

    context "originally with bundled with" do
      let(:original) { IO.read("spec/fixtures/lockfiles/bundled_with/Gemfile.lock") }
      let(:updated) { IO.read("spec/fixtures/lockfiles/bundled_with/Gemfile.lock.updated") }

      it "should keep as is" do
        result = exercise(original, updated)

        expect(result).to include "\nBUNDLED WITH\n   1.10.3\n"
      end
    end

    context "originally without bundled with" do
      let(:original) { IO.read("spec/fixtures/Gemfile.lock") }
      let(:updated) { IO.read("spec/fixtures/lockfiles/bundled_with/Gemfile.lock") }

      it "should not add" do
        result = exercise(original, updated)

        expect(result).not_to include "BUNDLED WITH"
      end
    end

    context "regressions" do
      let(:original) { IO.read("spec/fixtures/lockfiles/regressions/002.lock") }
      let(:updated) { IO.read("spec/fixtures/lockfiles/regressions/002-updated.lock") }

      it "can find BUNDLED_WITH without a newline" do
        result = exercise(original, updated)

        expect(result).to include "\nBUNDLED WITH\n   1.12.5\n"
      end
    end
  end
end
