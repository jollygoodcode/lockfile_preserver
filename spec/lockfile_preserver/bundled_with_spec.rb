RSpec.describe LockfilePreserver::BundledWith do
  describe "#keep" do
    let(:original) { Pathname("spec/fixtures/lockfiles/Gemfile.lock") }
    let(:original_v1_10_3) { Pathname("spec/fixtures/lockfiles/original/Gemfile.lock.v1_10_3") }
    let(:original_v1_10_4) { Pathname("spec/fixtures/lockfiles/original/Gemfile.lock.v1_10_4") }
    let(:updated_v1_10_3) { Pathname("spec/fixtures/lockfiles/updated/Gemfile.lock.v1_10_3") }
    let(:updated_v1_10_4) { Pathname("spec/fixtures/lockfiles/updated/Gemfile.lock.v1_10_4") }

    def exercise(original, updated)
      described_class.new(original, updated).keep
    end

    context "had bundled with" do
      it "keep bundled with as it was: original 1.10.3, updated to 1.10.4" do
        result = exercise(original_v1_10_3.read, updated_v1_10_4.read)

        expect(result).to include "\nBUNDLED WITH\n   1.10.3\n"
      end

      it "keep bundled with as it was: original 1.10.4, updated to 1.10.3" do
        result = exercise(original_v1_10_4.read, updated_v1_10_3.read)

        expect(result).to include "\nBUNDLED WITH\n   1.10.4\n"
      end

      it "file was without newline: original 1.10.3, updated to 1.10.4" do
        result = exercise(original_v1_10_3.read.strip, updated_v1_10_4.read)

        expect(result).to include "\nBUNDLED WITH\n   1.10.3\n"
      end

      it "file was without newline: original 1.10.4, updated to 1.10.3" do
        result = exercise(original_v1_10_4.read.strip, updated_v1_10_3.read)

        expect(result).to include "\nBUNDLED WITH\n   1.10.4\n"
      end
    end

    context "did not have bundled with: updated to 1.10.4" do
      it "do not add bundled with" do
        result = exercise(original.read, updated_v1_10_3.read)

        expect(result).not_to include "BUNDLED WITH"
      end

      it "do not add bundled with: updated to 1.10.4" do
        result = exercise(original.read, updated_v1_10_4.read)

        expect(result).not_to include "BUNDLED WITH"
      end
    end
  end
end
