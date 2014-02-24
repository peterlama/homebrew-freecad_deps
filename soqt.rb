require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Soqt < Formula
  homepage ''
  url 'https://bitbucket.org/Coin3D/coin/downloads/SoQt-1.5.0.zip'
  sha1 '87376d8b1c5ea002450835896d8c7ea0aa2f816c'
  #version '1.5.0'

  # depends_on 'cmake' => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    ENV.j1  # if your formula's build system can't parallelize
    flags = "-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -mmacosx-version-min=10.6"

    ENV['CFLAGS'] = flags
    ENV['CXXFLAGS'] = flags
    ENV['LDFLAGS'] = flags 

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--without-framework"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test soqt`.
    system "false"
  end
end
