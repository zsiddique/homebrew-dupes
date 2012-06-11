require 'formula'

class Tidy < Formula
  homepage 'http://tidy.sourceforge.net/'
  url 'ftp://mirror.internode.on.net/pub/gentoo/distfiles/tidy-20090325.tar.bz2'
  md5 '39a05125a2a2dbacaccac84af64e1dbc'

  def install
    system 'sh', 'build/gnuauto/setup.sh'
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make", "install"
  end
end
