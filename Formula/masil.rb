# Template for patrache/homebrew-tap Formula/masil.rb.
# The release workflow fills the version and the four per-platform sha256
# placeholders from checksums.txt with sed. Do not edit the rendered file in
# the tap by hand.
# No `service do` block: `masil daemon install` owns autostart registration.
class Masil < Formula
  desc "Terminal chat + social feed"
  homepage "https://github.com/patrache/masil"
  version "0.1.3-2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-2/masil_darwin_arm64.tar.gz"
      sha256 "d6d7d9cd1f1728fa00f97987be37661f3b6462dd9a0ffdf7cc348d0d1215c075"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-2/masil_darwin_amd64.tar.gz"
      sha256 "c316024c4da0c7c60c77cdf357825ac50174df7275fa099f8aeec73b8bb2e478"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-2/masil_linux_arm64.tar.gz"
      sha256 "1ed887811207f74c888bb4d68b12ec09da89c08367ed845cdd58f9e4693ba039"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-2/masil_linux_amd64.tar.gz"
      sha256 "a9767f79a6d4c368555e5d5aa11cd0040670a87a99df9d4b4d25abcfb135d250"
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
