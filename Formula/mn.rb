class Mn < Formula
  desc "Maho Notes CLI — personal knowledge base with multi-vault, FTS5+CJK search, GitHub sync"
  homepage "https://github.com/kuochuanpan/maho-notes"
  url "https://github.com/kuochuanpan/maho-notes/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "cb3e6247fa791fa87daba1c0e912f9df770a0ba71d3e889af00447f3a618d4bd"
  license :cannot_represent

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build",
           "--disable-sandbox",
           "-c", "release",
           "--product", "mn"
    bin.install ".build/release/mn"
  end

  test do
    assert_match "Maho Notes", shell_output("#{bin}/mn --help")
    assert_match version.to_s, shell_output("#{bin}/mn --version")
    assert_match "AI Agent Guide", shell_output("#{bin}/mn skill")
  end
end
