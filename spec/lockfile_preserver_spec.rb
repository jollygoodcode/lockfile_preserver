RSpec.describe LockfilePreserver do
  it "has a version number" do
    expect(LockfilePreserver::VERSION).not_to be nil
  end

  let(:original) { IO.read("spec/fixtures/Gemfile.lock") }
  let(:updated) { IO.read("spec/fixtures/lockfiles/ruby_versions/Gemfile.lock.rb24") }

  describe ".keep" do
    def exercise
      described_class.keep(original, updated, section)
    end

    context "keep bundled with" do
      let(:section) { :bundled_with }

      it "invokes correct method" do
        expect(LockfilePreserver::BundledWith).to receive(:new) { double(keep: true) }

        exercise
      end
    end

    context "keep ruby version" do
      let(:section) { :ruby_version }

      it "invokes correct method" do
        expect(LockfilePreserver::RubyVersion).to receive(:new) { double(keep: true) }

        exercise
      end
    end

    context "keep platforms" do
      let(:section) { :platforms }

      it "invokes correct method" do
        expect(LockfilePreserver::Platforms).to receive(:new) { double(keep: true) }

        exercise
      end
    end
  end

  describe ".keep_all" do
    it "keep bundled with and ruby version" do
      expect(LockfilePreserver::BundledWith).to receive(:new) { double(keep: true) }
      expect(LockfilePreserver::RubyVersion).to receive(:new) { double(keep: true) }
      expect(LockfilePreserver::Platforms).to receive(:new) { double(keep: true) }

      described_class.keep_all(original, updated)
    end
  end
end
