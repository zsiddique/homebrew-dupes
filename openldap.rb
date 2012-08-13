require 'formula'

class Openldap < Formula
  homepage 'http://www.openldap.org/software/'
  url 'ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-2.4.24.tgz'
  md5 '116fe1e23a7b67686d5e62274367e6c0'

  depends_on 'berkeley-db' if build.include? "with-berkeley-db"

  option 'with-berkeley-db', 'Compile with Berkeley-DB support'

  skip_clean 'var/run'

  def install
    args = ["--disable-dependency-tracking", "--prefix=#{prefix}"]

    args << "--enable-bdb=no" unless build.include? "with-berkeley-db"
    args << "--enable-hdb=no" unless build.include? "with-berkeley-db"

    system "./configure", *args
    system "make install"
    (var+'run').mkpath
  end
end
