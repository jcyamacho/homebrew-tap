class Memo < Formula
  desc "Durable memory CLI for humans and coding agents"
  homepage "https://github.com/jcyamacho/memo"
  url "https://github.com/jcyamacho/memo/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "5d06781994626ce54c0521ef96d6d501a55a9868d39553233210df6a935be129"

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
