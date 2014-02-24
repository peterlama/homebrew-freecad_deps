require 'formula'

class Swig < Formula
  homepage 'http://www.swig.org/'
  url 'http://downloads.sourceforge.net/project/swig/swig/swig-1.3.40/swig-1.3.40.tar.gz'
  sha1 '7e7a426579f2d2d967b731abf062b33aa894fb4e'

  option :universal

  depends_on 'pcre'
  depends_on :python  # assure swig find the "right" python
  depends_on :python3 => :optional

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
