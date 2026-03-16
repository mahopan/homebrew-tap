class Mn < Formula
  desc "Maho Notes CLI — personal knowledge base with multi-vault, FTS5+CJK search, GitHub sync"
  homepage "https://github.com/kuochuanpan/maho-notes"
  url "https://github.com/kuochuanpan/maho-notes/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "23d0d626b031e01eeaa5823bffe292852fb14e24a7607cd43e7d7b0c74f272bc"
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
