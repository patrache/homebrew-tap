# Template for patrache/homebrew-tap Formula/masil.rb.
# The release workflow fills the version and the four per-platform sha256
# placeholders from checksums.txt with sed. Do not edit the rendered file in
# the tap by hand.
# No `service do` block: `masil daemon install` owns autostart registration.
class Masil < Formula
  desc "Terminal chat + social feed"
  homepage "https://github.com/patrache/masil"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3/masil_darwin_arm64.tar.gz"
      sha256 "433cfe83a49e72fa61123ae8452dfdbe0369ff39a533ad26fe2ed0080e6f1785"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3/masil_darwin_amd64.tar.gz"
      sha256 "4f2bba000e44e76dc546e56c60e1624a010efc70bba049029d1e4bfea2d0e46c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.3/masil_linux_arm64.tar.gz"
      sha256 "0daa1564ee67fe5a19d1624eb806892f6ec3e26caff45060c83a6a88bcaae100"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.3/masil_linux_amd64.tar.gz"
      sha256 "9d5c96812ec2bb210f9e2b8944daf144355db874f9f56be21f438f82eea8abfa"
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
