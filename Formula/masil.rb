# Template for patrache/homebrew-tap Formula/masil.rb.
# The release workflow fills the version and the four per-platform sha256
# placeholders from checksums.txt with sed. Do not edit the rendered file in
# the tap by hand.
# No `service do` block: `masil daemon install` owns autostart registration.
class Masil < Formula
  desc "터미널 채팅 + SNS"
  homepage "https://github.com/patrache/masil"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.2/masil_darwin_arm64.tar.gz"
      sha256 "c428084343ddb37e613866e73eb62202e474179d2eca4822fd74fa6fb9fa90e1"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.2/masil_darwin_amd64.tar.gz"
      sha256 "96bff10ee868cb49f37df1a00bc4e4e89622f7d2316c711a7ae6113ac261f586"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.2/masil_linux_arm64.tar.gz"
      sha256 "f219c20584b3505d7d95d91daa9e213c00fdeb2d5e28bd35b827925cdd5921a3"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.2/masil_linux_amd64.tar.gz"
      sha256 "bfd9d2a8f6ea5ca1ebb5d871a9348cc5dfd00e55f0674f8355db8517f300882a"
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
