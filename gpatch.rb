require 'formula'

class Gpatch < Formula
  homepage 'http://savannah.gnu.org/projects/patch/'
  # Use a slightly newer version with build fixes
  url 'http://alpha.gnu.org/gnu/patch/patch-2.6.1.188-66ae.tar.gz'
  version '2.6.1'
  sha1 'caac60a80abc915b8d17d236d601e36238f7068a'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
