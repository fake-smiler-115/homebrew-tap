
class TypingTest < Formula
  desc "Terminal typing speed test"
  homepage "https://github.com/fake-smiler-115/typing-test"
  url "https://github.com/fake-smiler-115/typing-test/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "8b38313bdddf8ae0e403a01a800a0add3e5e8ed877afed9e149718d087141939"
  license "MIT"

  depends_on "deno"

  def install
    libexec.install Dir["*"]
    (bin/"typing-test").write <<~SH
      #!/bin/bash
      cd "#{libexec}"
      exec deno run --allow-read --allow-write --allow-env --allow-run main.js "$@"
    SH
    chmod 0755, bin/"typing-test"
  end

  test do
    assert_predicate bin/"typing-test", :exist?
  end
end
