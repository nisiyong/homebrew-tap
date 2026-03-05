class Remindctl < Formula
  desc "Fast CLI for Apple Reminders"
  homepage "https://github.com/nisiyong/remindctl"
  url "https://github.com/nisiyong/remindctl/releases/download/v0.1.1/remindctl-macos.zip"
  version "0.1.1"
  sha256 "9a45fb62dbb8a2fe315fc10551b56b634bd725311920c990c5fa6ec1bbf63c23"
  license "MIT"

  depends_on macos: :sonoma

  def install
    bin.install "remindctl"
  end

  def caveats
    <<~EOS
      remindctl needs Reminders access.
      System Settings > Privacy & Security > Reminders
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/remindctl --version")
    assert_match "Manage Apple Reminders", shell_output("#{bin}/remindctl --help")
  end
end
