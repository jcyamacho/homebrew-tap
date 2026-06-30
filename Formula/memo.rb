class Memo < Formula
  desc "Durable memory CLI for humans and coding agents"
  homepage "https://github.com/jcyamacho/memo"
  url "https://github.com/jcyamacho/memo/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "4b930ce5a72dc9c66bbe5f5b61029148d041d32ee4884fa00ec3392f3f604223"

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
