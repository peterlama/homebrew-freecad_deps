flags = "-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -mmacosx-version-min=10.6"

ENV['CFLAGS'] = flags
ENV['CXXFLAGS'] = flags
ENV['LDFLAGS'] = flags

