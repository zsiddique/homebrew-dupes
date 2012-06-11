require 'formula'

class Libarchive < Formula
  homepage 'http://libarchive.github.com/'
  url 'https://github.com/downloads/libarchive/libarchive/libarchive-3.0.4.tar.gz'
  md5 'af443ca9a10ddbcbf00f7ae34ca7fc16'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
