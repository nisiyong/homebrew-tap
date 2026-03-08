class Remindctl < Formula
  desc "Fast CLI for Apple Reminders"
  homepage "https://github.com/nisiyong/remindctl"
  url "https://github.com/nisiyong/remindctl/releases/download/beta-v0.2.0-beta.1-main-d351ee5/remindctl-macos.zip"
  version "0.2.0-beta.1"
  sha256 "5d54a0ceef351912c202b560952e2ab3e7aa8f6567143ebd04d986ddd37a787a"
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
