require 'formula'

class Tk < Formula
  url 'http://downloads.sourceforge.net/project/tcl/Tcl/8.6.0/tk8.6.0-src.tar.gz'
  sha1 'c42e160285e2d26eae8c2a1e6c6f86db4fa7663b'
end

class TclTk < Formula
  homepage 'http://www.tcl.tk/'
  url 'http://downloads.sourceforge.net/project/tcl/Tcl/8.6.0/tcl8.6.0-src.tar.gz'
  version '8.6.0'
  sha1 'fc57fc08ab113740a702bb67d4f350f8ec85ef58'

  keg_only "Tk installs some X11 headers and OS X provides an (older) Tcl/Tk."

  option 'enable-threads', 'Build with multithreading support'
  option 'without-tk', "Don't build the Tk (window toolkit)"
  option 'with-x11', 'Build X11-based Tk instead of Aqua-basd Tk'

  depends_on :x11 => :optional

  def install
    args = ["--prefix=#{prefix}", "--mandir=#{man}"]
    args << "--enable-threads" if build.include? "enable-threads"
    args << "--enable-64bit" if MacOS.prefer_64_bit?

    cd 'unix' do
      system "./configure", *args
      system "make"
      system "make install"
      system "make install-private-headers"
      ln_s bin+'tclsh8.6', bin+'tclsh'
    end

    unless build.without? 'tk'
      ENV.prepend 'PATH', bin, ':'  # so that tk finds our new tclsh

      Tk.new.brew do
        args = ["--prefix=#{prefix}",  # this is the prefix from TclTk
                "--mandir=#{man}",
                "--with-tcl=#{lib}"]
        args << "--enable-threads" if build.include? "enable-threads"
        args << "--enable-64bit" if MacOS.prefer_64_bit?

        if build.with? "x11"
          args << "--with-x"
        else
          args << "--enable-aqua=yes"
          args << "--without-x"
        end

        cd 'unix' do
          system "./configure", *args
          system "make", "TK_LIBRARY=#{lib}"
          # system "make test"  # for maintainers
          system "make install"
          system "make install-private-headers"
          ln_s bin+'wish8.6', bin+'wish'
        end
      end
    end
  end
end
