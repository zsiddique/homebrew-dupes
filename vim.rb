require 'formula'

class Vim < Formula
  homepage 'http://www.vim.org/'
  # Get stable versions from hg repo instead of downloading an increasing
  # number of separate patches.
  url 'https://vim.googlecode.com/hg/', :tag => 'v7-3-531'
  version '7.3.531'

  head 'https://vim.googlecode.com/hg/'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--enable-gui=no",
                          "--without-x",
                          "--disable-nls",
                          "--enable-multibyte",
                          "--with-tlib=ncurses",
                          "--enable-pythoninterp",
                          "--enable-rubyinterp",
                          "--enable-cscope",
                          "--with-ruby-command=/usr/bin/ruby",
                          "--with-features=huge"
    system "make"
    system "make install"
  end
end
