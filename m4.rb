require 'formula'

class M4 < Formula
  homepage 'http://www.gnu.org/software/m4'
  url 'http://ftpmirror.gnu.org/m4/m4-1.4.16.tar.bz2'
  mirror 'http://ftp.gnu.org/gnu/m4/m4-1.4.16.tar.bz2'
  md5 '8a7cef47fecab6272eb86a6be6363b2f'

  keg_only :provided_by_osx

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
