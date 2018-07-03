class Betterxc < Formula
  desc "Regenerate Xcode project and add optional SwiftLint/Sourcery integrations"
  url "https://github.com/monstar-lab/BetterXC/archive/0.9.3.tar.gz"
  sha256 "f042d9520fb7cbb9c590f600114880f1744f76159f5b93e76b68f2c7f360f3e4"
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
