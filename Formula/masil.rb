# Template for patrache/homebrew-tap Formula/masil.rb.
# The release workflow fills the version and the four per-platform sha256
# placeholders from checksums.txt with sed. Do not edit the rendered file in
# the tap by hand.
# No `service do` block: `masil daemon install` owns autostart registration.
class Masil < Formula
  desc "Terminal chat + social feed"
  homepage "https://github.com/patrache/masil"
  version "0.1.3-3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-3/masil_darwin_arm64.tar.gz"
      sha256 "343be4ae221375257032a17f98c4cf4d70cab60db99ce8c57ba6e4ffa01041c1"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-3/masil_darwin_amd64.tar.gz"
      sha256 "e349e3d8bfb308f42653a4c0b0e77079c447c8ff33f152259d49f07c5fda9262"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-3/masil_linux_arm64.tar.gz"
      sha256 "c3f84c099f21390b108a7f5f9aaac5030d883cd81a45e2eb6d6287b76fb64418"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-3/masil_linux_amd64.tar.gz"
      sha256 "336ab091f3bf667089805e97e389eb4826973d04dcfee3dedbd46509c5b15adf"
    end
  end

  def install
    bin.install "masil"
  end

  def caveats
    <<~EOS
      Start the notification daemon at login: masil daemon install
      알림 데몬 자동 시작: masil daemon install
      After brew upgrade a registered daemon restarts itself on the new version — check with 'masil daemon status', and if it has not changed run 'masil daemon install' again.
      brew upgrade 뒤 등록된 데몬은 새 버전으로 스스로 다시 뜹니다 — 'masil daemon status' 로 확인하고, 안 바뀌었으면 'masil daemon install' 을 다시 실행하세요.
      Before uninstalling, run 'masil daemon uninstall' first.
      제거 전에 'masil daemon uninstall' 을 먼저 실행하세요.
      To use the lazygit tool: brew install lazygit
      lazygit 도구를 쓰려면: brew install lazygit
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/masil version")
  end
end
