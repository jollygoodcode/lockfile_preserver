RSpec.describe LockfilePreserver::RubyVersion do
  describe "#keep" do
    context "originally with RUBY VERSION" do
      let(:original) { IO.read("spec/fixtures/lockfiles/ruby_versions/Gemfile.lock") }
      let(:updated) { IO.read("spec/fixtures/lockfiles/ruby_versions/Gemfile.lock.updated") }

      it "should keep as is" do
        result = described_class.new(original, updated).keep

        expect(result).to include "\nRUBY VERSION\n   ruby 2.3.1p112\n"
      end
    end

    context "originally without RUBY VERSION" do
      let(:original) { IO.read("spec/fixtures/Gemfile.lock") }
      let(:updated) { IO.read("spec/fixtures/lockfiles/ruby_versions/Gemfile.lock") }

      it "should not add" do
        result = described_class.new(original, updated).keep

        expect(result).not_to include "\nRUBY VERSION\n   ruby 2.3.1p112\n"
      end
    end

    context "with RUBY VERSION section change" do
      let(:original) { IO.read("spec/fixtures/lockfiles/ruby_versions/Gemfile.lock") }
      let(:updated) { IO.read("spec/fixtures/lockfiles/ruby_versions/Gemfile.lock.rb24") }

      it "should keep as is" do
        result = described_class.new(original, updated).keep

        expect(result).to include "\nRUBY VERSION\n   ruby 2.3.1p112\n"
      end
    end

    context "regression" do
      let(:original) { IO.read("spec/fixtures/lockfiles/regressions/001.lock") }
      let(:updated) { IO.read("spec/fixtures/lockfiles/regressions/001-updated.lock") }

      it "should keep as is" do
        result = described_class.new(original, updated).keep

        expect(result).to include "\nRUBY VERSION\n   ruby 2.3.1p112\n"
      end
    end
  end
end
