# Template for patrache/homebrew-tap Formula/masil.rb.
# The release workflow fills the version and the four per-platform sha256
# placeholders from checksums.txt with sed. Do not edit the rendered file in
# the tap by hand.
# No `service do` block: `masil daemon install` owns autostart registration.
class Masil < Formula
  desc "터미널 채팅 + SNS"
  homepage "https://github.com/patrache/masil"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.1/masil_darwin_arm64.tar.gz"
      sha256 "3bd9dea5e3e2f18780a73dfc749eb21d8f44ec3eb55d42a52290c35aa97e219d"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.1/masil_darwin_amd64.tar.gz"
      sha256 "ff05b18959ce8e414ff6dd4d637debc34fef7f195296b93a4898c8325e5f6203"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patrache/masil/releases/download/v0.1.1/masil_linux_arm64.tar.gz"
      sha256 "c2280fca2f8bdf0a2644e497739ebe26a4cb30f9c4a6a463617bb80741e410a9"
    end
    on_intel do
      url "https://github.com/patrache/masil/releases/download/v0.1.1/masil_linux_amd64.tar.gz"
      sha256 "8cc42ee3de5547eee2d86d4c2baa797b1c91362211f0d56d9911b894894f25db"
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
