class Dskmap < Formula
  desc "Fast disk usage analyzer with a sorted tree view and an interactive browser"
  homepage "https://github.com/shuvadiproy/dskmap"
  url "https://github.com/shuvadiproy/dskmap/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "95de6077104873e517263ff71062939e7b973d1cd7435fca2397924713b7e862"
  license "MIT"
  head "https://github.com/shuvadiproy/dskmap.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dsk --version")

    (testpath/"data/sub").mkpath
    (testpath/"data/sub/file.txt").write "hello"
    output = shell_output("#{bin}/dsk -t --no-color #{testpath}/data")
    assert_match "sub/", output
    assert_match "file.txt", output
  end
end
