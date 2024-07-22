VERSION="0.1.1"
PRODUCT="ash"

class Ash < Formula
  desc "A tool for archiving files and directories and extracting several archive formats."
  homepage "https://github.com/tanabe5/ash"
  version VERSION
  license "MIT"

  option "without-completions", "Disable completions"
  depends_on "bash-completion@2" => :optional

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/tanabe5/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_amd64.tar.gz"
    sha256 "1650125eb012e89a9f8fd0369feb8386d0c831880af912673dd00bc504976e6f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/tanabe5/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_arm64.tar.gz"
    sha256 "92ea58c3c873ecc8ea52c39b48f30af10e538169725504d6353fa43cf48984cd"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/tanabe5/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_amd64.tar.gz"
    sha256 "14fa2c2bdc61eee09abf03a1caea0f6d17a0918b6dc78f6b9dd1d24180236a3f"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/tanabe5/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_arm64.tar.gz"
    sha256 "509395e8ac029a8c5b0ae76057b9c1c3a94b294cb1a808875ef3426dc965d09a"
  end

  def install
    bin.install "ash"

    bash_completion.install "completions/bash/ash" if build.with? "completions"
    fish_completion.install "completions/fish/ash" if build.with? "completions"
    zsh_completion.install  "completions/zsh/_ash"  if build.with? "completions"
  end

  test do
    system "#{bin}/ash --version"
  end
end
