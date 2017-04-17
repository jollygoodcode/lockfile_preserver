RSpec.describe LockfilePreserver::Platforms do
  describe "#keep" do
    context "with PLATFORMS" do
      it "of java, should keep as is" do
        original = IO.read("spec/fixtures/lockfiles/platforms/Gemfile.lock")
        updated = IO.read("spec/fixtures/lockfiles/platforms/Gemfile.lock.updated")

        result = described_class.new(original, updated).keep

        expect(result).to include "\nPLATFORMS\n  java\n"
      end

      it "of ruby, should keep as is" do
        original = IO.read("spec/fixtures/lockfiles/ruby_versions/Gemfile.lock")
        updated = IO.read("spec/fixtures/lockfiles/ruby_versions/Gemfile.lock.updated")

        result = described_class.new(original, updated).keep

        expect(result).to include "\nPLATFORMS\n  ruby\n"
      end
    end

    context "without PLATFORMS" do
      it "should not add PLATFORMS" do
        original = IO.read("spec/fixtures/lockfiles/regressions/001.lock")
        updated = IO.read("spec/fixtures/lockfiles/regressions/001-updated.lock")

        result = described_class.new(original, updated).keep

        expect(result).to include "\nPLATFORMS\n  ruby\n"
      end

      it "should not add PLATFORMS" do
        original = IO.read("spec/fixtures/lockfiles/bundled_with/Gemfile.lock")
        updated = IO.read("spec/fixtures/lockfiles/bundled_with/Gemfile.lock.updated")

        result = described_class.new(original, updated).keep

        expect(result).to include "\nPLATFORMS\n  ruby\n"
      end
    end
  end
end
