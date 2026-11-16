# Template for patrache/homebrew-tap Formula/masil.rb.
# The release workflow fills the version and the four per-platform sha256
# placeholders from checksums.txt with sed. Do not edit the rendered file in
# the tap by hand.
# No `service do` block: `masil daemon install` owns autostart registration.
class Masil < Formula
  desc "Terminal chat + social feed"
  homepage "https://github.com/patrache/masil"
  version "0.1.3-4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-4/masil_darwin_arm64.tar.gz"
      sha256 "b25fd124f617cb8c1998236f6988ec9d530d60c1dd69cbc7a8b1aa2c546450ec"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-4/masil_darwin_amd64.tar.gz"
      sha256 "a7d4017717c5d3278156bd47042e7e2164e75bca7445041fe89ef067fd1477c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-4/masil_linux_arm64.tar.gz"
      sha256 "10952a3b6288dd2843f26de5755aaa2096c13ff0beb58e9766881be7244226ba"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3-4/masil_linux_amd64.tar.gz"
      sha256 "ecbc626ebeecdfa9e06ba977c32423bd03c4bcf4280fc4bafb080b0db4dacdf9"
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
