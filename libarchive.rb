require 'formula'

class Libarchive < Formula
  url 'https://github.com/downloads/libarchive/libarchive/libarchive-3.0.4.tar.gz'
  homepage 'http://code.google.com/p/libarchive/'
  md5 'af443ca9a10ddbcbf00f7ae34ca7fc16'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
