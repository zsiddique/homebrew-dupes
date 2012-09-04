require 'formula'

class Tcpdump < Formula
  homepage 'http://www.tcpdump.org/'
  url 'http://www.tcpdump.org/release/tcpdump-4.2.1.tar.gz'
  sha1 '60f23bc5c9281b56a1f281b4ba46a82449c637d7'

  head 'git://bpf.tcpdump.org/tcpdump'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-ipv6",
                          "--disable-smb",
                          "--disable-universal"
    system "make install"
  end
end
