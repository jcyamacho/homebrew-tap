class Memo < Formula
  desc "Durable memory CLI for humans and coding agents"
  homepage "https://github.com/jcyamacho/memo"
  url "https://github.com/jcyamacho/memo/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e0e22f9e05b9874e948ed115720251c8bd3cbd8c60266c8297dc5e234133eab9"

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
