require 'formula'

class Coin < Formula
  homepage 'https://bitbucket.org/Coin3D/coin/wiki/Home'
  url 'https://bitbucket.org/Coin3D/coin/downloads/Coin-3.1.3.tar.gz'
  sha1 '8e9f05628461963623686d3ec53102214e233dd1'

  def install
    flags = "-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -mmacosx-version-min=10.6"

    ENV.append 'CFLAGS', *flags
    ENV.append 'CXXFLAGS', *flags
    ENV.append 'LDFLAGS', *flags 

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-framework"
    system "make install"
  end

end
