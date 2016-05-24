require "lockfile_preserver/version"
require "lockfile_preserver/pipeline"
require "lockfile_preserver/bundled_with"
require "lockfile_preserver/ruby_version"

module LockfilePreserver
  def self.keep(original, updated, section = :bundled_with)
    if section == :bundled_with
      LockfilePreserver::BundledWith.new(original, updated).keep
    elsif section == :ruby_version
      LockfilePreserver::RubyVersion.new(original, updated).keep
    elsif
      abort %(We currently only support preserve "BUNDLED WITH" & "RUBY VERSION" section of lockfile.)
    end
  end

  def self.keep_all(original, updated)
    pipeline = Pipeline.new [
      LockfilePreserver::BundledWith,
      LockfilePreserver::RubyVersion  
    ]

    pipeline.call(original, updated)
  end
end
