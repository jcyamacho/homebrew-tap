class Memo < Formula
  desc "Durable memory CLI for humans and coding agents"
  homepage "https://github.com/jcyamacho/memo"
  url "https://github.com/jcyamacho/memo/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "49c0baca7a29d4c8e9e0d154c51f81bd85b3c25b250a89fa413c38ba31bc40c8"

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
