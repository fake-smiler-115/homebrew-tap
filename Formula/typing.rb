
class Typing < Formula
  desc "Terminal typing speed test"
  homepage "https://github.com/fake-smiler-115/typing-test"
  url "https://github.com/fake-smiler-115/typing-test/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "10260e5b42fd701436599a9d8204c63ad2621951c925d9a836eb993885068f93"
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
