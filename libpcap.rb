require 'formula'

class Libpcap < Formula
  homepage 'http://www.tcpdump.org/'
  url 'http://www.tcpdump.org/release/libpcap-1.3.0.tar.gz'
  md5 'f78455a92622b7a3c05c58b6ad1cec7e'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-ipv6",
                          "--disable-universal"
    system "make install"
  end
end
