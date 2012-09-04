require 'formula'

class Bison < Formula
  homepage 'http://www.gnu.org/software/bison/'
  url 'http://ftpmirror.gnu.org/bison/bison-2.5.tar.bz2'
  mirror 'http://ftp.gnu.org/gnu/bison/bison-2.5.tar.bz2'
  sha1 '907319624fe4f4c5f9e2c3e23601041ac636ae31'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
