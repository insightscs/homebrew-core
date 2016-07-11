class Mspdebug < Formula
  desc "Debugger for use with MSP430 MCUs"
  homepage "http://dlbeer.co.nz/mspdebug/"
  url "https://github.com/dlbeer/mspdebug/archive/v0.24.tar.gz"
  sha256 "ace77951dc36227bbc4d5df1c33c1e5de833cccded33aa2a322c831bd8f8c146"

  bottle do
    sha256 "ca534bad59641ade8811ce3e78ba7738746ed826cd9f8e4cf49750f0ea40ee7b" => :el_capitan
    sha256 "d867fe5b0ec60ee3c4bb60c247f5f6f8539bd33447107e271e01d91b8f5718e2" => :yosemite
    sha256 "c0c42979013ec17216dd7e5ec7cb9bec2284f72324048ebe48d411e23035cedb" => :mavericks
  end

  depends_on "libusb-compat"

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  def caveats; <<-EOS.undent
    You may need to install a kernel extension if you're having trouble with
    RF2500-like devices such as the TI Launchpad:
      http://dlbeer.co.nz/mspdebug/faq.html#rf2500_osx
    EOS
  end

  test do
    system bin/"mspdebug", "--help"
  end
end
