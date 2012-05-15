require 'formula'

class Grep < Formula
  homepage 'http://www.gnu.org/software/grep/'
  url 'http://ftpmirror.gnu.org/grep/grep-2.12.tar.xz'
  mirror 'http://ftp.gnu.org/gnu/grep/grep-2.12.tar.xz'
  md5 '8d2f0346d08b13c18afb81f0e8aa1e2f'

  depends_on 'pcre'

  def install
    # find the correct libpcre
    pcre = Formula.factory('pcre')
    ENV.append 'LDFLAGS', "-L#{pcre.lib} -lpcre"
    ENV.append 'CPPFLAGS', "-I#{pcre.include}"

    system "./configure", "--disable-dependency-tracking",
                          "--disable-nls",
                          "--prefix=#{prefix}",
                          "--infodir=#{info}",
                          "--mandir=#{man}"
    system "make"
    system "make install"
  end
end
