class Mn < Formula
  desc "Maho Notes CLI — personal knowledge base with multi-vault, FTS5+CJK search, GitHub sync"
  homepage "https://github.com/kuochuanpan/maho-notes"
  url "https://github.com/kuochuanpan/maho-notes/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "01cb7ae282898bd35c7dd8854fd17ed5afdeaafbc18a1f9a4c5bcaef90a32db2"
  license "MIT"

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
