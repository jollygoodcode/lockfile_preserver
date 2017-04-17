RSpec.describe LockfilePreserver::Pipeline do
  describe "#call" do
    let(:original) { IO.read("spec/fixtures/Gemfile.lock") }
    let(:updated) { IO.read("spec/fixtures/lockfiles/ruby_versions/Gemfile.lock") }

    it "takes preservers" do
      pipeline = described_class.new [
        LockfilePreserver::BundledWith,
        LockfilePreserver::RubyVersion,
        LockfilePreserver::Platforms,
      ]

      result = pipeline.call(original, updated)

      expect(result).to eq original
    end
  end
end
