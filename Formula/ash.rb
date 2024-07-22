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
    sha256 "20674a5e8bf1cf465f711d135603d015adaffd0636ab2dea799d63d4feca7397"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/tanabe5/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_arm64.tar.gz"
    sha256 "7e945c9c8274669e9c94d3e43583ece523e7e96ce69ac992d90ac5ce50d5cd68"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/tanabe5/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_amd64.tar.gz"
    sha256 "dfad8de4a6e80404a6f055cfe628465fe72098e694f944db00c589d63c7978ad"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/tanabe5/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_arm64.tar.gz"
    sha256 "b8c1cf16fb2a4939e3f7fdf52ee2b9d69060f436a78bb3b256aab5976e9dd94b"
  end

  def install
    bin.install "ash"

    bash_completion.install "completions/bash/sibling.bash" if build.with? "completions"
    fish_completion.install "completions/fish/sibling.bash" if build.with? "completions"
    zsh_completion.install  "completions/zsh/sibling.bash"  if build.with? "completions"
  end

  test do
    system "#{bin}/ash --version"
  done
end
