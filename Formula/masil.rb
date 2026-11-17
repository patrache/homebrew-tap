# Template for patrache/homebrew-tap Formula/masil.rb.
# The release workflow fills the version and the four per-platform sha256
# placeholders from checksums.txt with sed. Do not edit the rendered file in
# the tap by hand.
# No `service do` block: `masil daemon install` owns autostart registration.
class Masil < Formula
  desc "Terminal chat + social feed"
  homepage "https://github.com/patrache/masil"
  version "0.1.3-5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-5/masil_darwin_arm64.tar.gz"
      sha256 "38afa295b8dbe56af39227fef65b64969a931fa2498b654e64ede7de5eb9f3e6"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-5/masil_darwin_amd64.tar.gz"
      sha256 "e1957cad0248c1d5f80bf12c593dbf7536f9e9c8fc3caa19a30ea81b617af285"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-5/masil_linux_arm64.tar.gz"
      sha256 "7f64c3387e5638b557633801d76970d2a38a718035d350dafba75db2edd57f2e"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-5/masil_linux_amd64.tar.gz"
      sha256 "c620c9b00ad92e7ffd543eb1547bd48e5f599e80e4af3889f65844b8fd398fe3"
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
