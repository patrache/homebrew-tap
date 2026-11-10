# Template for patrache/homebrew-tap Formula/masil.rb.
# The release workflow fills the version and the four per-platform sha256
# placeholders from checksums.txt with sed. Do not edit the rendered file in
# the tap by hand.
# No `service do` block: `masil daemon install` owns autostart registration.
class Masil < Formula
  desc "Terminal chat + social feed"
  homepage "https://github.com/patrache/masil"
  version "0.1.3-1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-1/masil_darwin_arm64.tar.gz"
      sha256 "9d70c0632ab341458f046cf80eaee90171335b1355450c8613ad0b663281732a"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-1/masil_darwin_amd64.tar.gz"
      sha256 "9685fc153fa16a198d1546bc93a2aecebce158066d57f0ab244a69b7bbe67180"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-1/masil_linux_arm64.tar.gz"
      sha256 "5eccc0c3047d9c20b4d933f7ae3c3ae01e173d21b37108002eff9c5e4ef6984e"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-1/masil_linux_amd64.tar.gz"
      sha256 "55390d7ae677fe27d67fed3d46d2d4e99a9d602755f2ae17fa1205e45a1a0092"
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
