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
    sha256 "e9752c5965da9385727156d815337d7db7ce3cdaa8de03772f3b6fab566fcb7a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/tanabe5/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_arm64.tar.gz"
    sha256 "22b4f4a443a80534494592b96cb4eec9a3e25caf296197f3cec534bfc464b5f3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/tanabe5/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_amd64.tar.gz"
    sha256 "f19716ad82fa8dd2079ee9f4f76935e8e16e475014598427a8668c69c4fb8313"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/tanabe5/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_arm64.tar.gz"
    sha256 "d6bc789afdae200dee00e6782d8c46b0c01753ee838a9deaea636905cbdcdd21"
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
