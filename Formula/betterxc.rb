class Betterxc < Formula
  desc "Regenerate Xcode project and add optional SwiftLint/Sourcery integrations"
  url "https://github.com/monstar-lab/BetterXC/archive/0.9.2.tar.gz"
  sha256 "9e4f7ae9800ce70aa354f7538d2847aaaeb7d4fb88b2db2b0722df0a7e104ab5"
  head "https://github.com/monstar-lab/betterxc"

  depends_on :xcode => ["9.3", :build]

  def install
    ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp

    system "swift", "build", "--disable-sandbox", "-c", "release", "-Xswiftc",
           "-static-stdlib"

    bin.install ".build/release/xc"
    # lib.install Dir[".build/release/*.dylib"]
  end
end
