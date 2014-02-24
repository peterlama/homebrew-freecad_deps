require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Oce < Formula
  homepage ''
  url 'https://github.com/tpaviot/oce/archive/OCE-0.12.zip'
  sha1 'f26603fd1e63bca25032893f1ea60f0a891fd575'

  depends_on 'cmake' => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    ENV.append 'CFLAGS', "-I /opt/X11/include" 
    ENV.append 'CXXFLAGS', "-I /opt/X11/include" 
    
    args = *std_cmake_args 
    args << "-DCMAKE_OSX_SYSROOT=#{MacOS.sdk_path(10.8)}"
    args << "-DCMAKE_OSX_DEPLOYMENT_TARGET=10.6"
    system "mkdir build"
    args << ".."
    Dir.chdir 'build' do
      system "cmake", *args
      system "make install"
    end

  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test OCE`.
    system "false"
  end
end
