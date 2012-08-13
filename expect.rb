require 'formula'

class Expect < Formula
  homepage 'http://expect.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/expect/Expect/5.45/expect5.45.tar.gz'
  md5 '44e1a4f4c877e9ddc5a542dfa7ecc92b'

  option 'enable-threads', 'Build with multithreading support'

  def install
    args = ["--prefix=#{prefix}", "--exec-prefix=#{prefix}", "--mandir=#{man}"]
    args << "--enable-shared"
    args << "--enable-threads" if build.include? "enable-threads"
    args << "--enable-64bit" if MacOS.prefer_64_bit?

    system "./configure", *args
    system "make"
    system "make install"
  end

  def test
    system "#{bin}/mkpasswd"
  end
end
