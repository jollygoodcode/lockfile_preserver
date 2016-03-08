require "spec_helper"

RSpec.describe LockfilePreserver do
  it "has a version number" do
    expect(LockfilePreserver::VERSION).not_to be nil
  end
end
