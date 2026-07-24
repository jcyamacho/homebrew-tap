class Memo < Formula
  desc "Durable memory CLI for humans and coding agents"
  homepage "https://github.com/jcyamacho/memo"
  url "https://github.com/jcyamacho/memo/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "5e2218b5a7989d2a4729ca24843334d486dbbe176b8e2e2b9fe1acd25925094d"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/jcyamacho/memo/cmd.version=#{version}
    ]

    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "memo #{version}", shell_output("#{bin}/memo version")
  end
end
