require 'formula'

class Httpd < Formula
  homepage 'http://httpd.apache.org/'
  url 'http://www.apache.org/dist/httpd/httpd-2.4.3.tar.bz2'
  sha1 '0ef1281bb758add937efe61c345287be2f27f662'

  skip_clean :la

  def install
ENV['LTFLAGS'] = '--tag CC'
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--enable-layout=GNU",
                          "--enable-mods-shared=all",
                          "--with-ssl=/usr",
                          "--with-mpm=prefork",
                          "--disable-unique-id",
                          "--enable-ssl",
                          "--enable-dav",
                          "--enable-cache",
                          "--enable-proxy",
                          "--enable-logio",
                          "--enable-deflate",
                          "--with-included-apr",
                          "--enable-cgi",
                          "--enable-cgid",
                          "--enable-suexec",
                          "--enable-rewrite"
    system "make"
    system "make install"
  end

  def startup_plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>com.apache.httpd</string>
      <key>ProgramArguments</key>
      <array>
        <string>/usr/local/sbin/apachectl</string>
        <string>start</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>
    EOS
  end
end
