require "lockfile_preserver/version"
require "lockfile_preserver/bundled_with"

module LockfilePreserver
  def self.keep(original, updated, section = :bundled_with)
    if section == :bundled_with
      LockfilePreserver::BundledWith.new(original, updated).keep
    else
      abort "We currently only support preserve BUNDLED_WITH section of lockfile."
    end
  end
end
