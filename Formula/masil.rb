# Template for patrache/homebrew-tap Formula/masil.rb.
# The release workflow fills the version and the four per-platform sha256
# placeholders from checksums.txt with sed. Do not edit the rendered file in
# the tap by hand.
# No `service do` block: `masil daemon install` owns autostart registration.
class Masil < Formula
  desc "터미널 채팅 + SNS"
  homepage "https://github.com/patrache/masil"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.0/masil_darwin_arm64.tar.gz"
      sha256 "5a4b4cfbaf90ce21402c7c8d64548ccebdb27ee9f7f2d35831899e8061813f84"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.0/masil_darwin_amd64.tar.gz"
      sha256 "db1a5f72e1e1a75b301ae87d6e6eab3250ae2cb4ce4b2f419d1e1bb8d99def24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.0/masil_linux_arm64.tar.gz"
      sha256 "00223b7e343b6f258cfabd2f69ae9fec0e2e4c61e5f28cfbe0c8917efabda2df"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.0/masil_linux_amd64.tar.gz"
      sha256 "eaa9c8e3073f93b0cc120f20edcddf68fa5c1f789bd01115731abdb13c0b469f"
    end
  end

  def install
    bin.install "masil"
  end

  def caveats
    <<~EOS
      알림 데몬 자동 시작: masil daemon install
      brew upgrade 뒤 등록된 데몬은 새 버전으로 스스로 다시 뜹니다 — 'masil daemon status' 로 확인하고, 안 바뀌었으면 'masil daemon install' 을 다시 실행하세요.
      제거 전에 'masil daemon uninstall' 을 먼저 실행하세요.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/masil version")
  end
end
