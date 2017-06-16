#------------------------------------------------------------------------------
# ubiq.rb
#
# Homebrew formula for gubiq.  Homebrew (http://brew.sh/) is
# the de-facto standard package manager for OS X, and this Ruby script
# contains the metadata used to map command-line user settings used
# with the 'brew' command onto build options.
#
#
# (c) 2014-2017 cpp-ethereum contributors.
# (c) 2017 ubiq contributors.
#------------------------------------------------------------------------------

require 'formula'

class Ubiq < Formula
  homepage 'https://github.com/ubiq/go-ubiq'
  url 'https://github.com/ubiq/go-ubiq.git', :tag => 'v1.5.12'

  devel do
    url 'https://github.com/ubiq/go-ubiq.git', :branch => 'master'
  end

  depends_on 'go' => :build

  def install
    ENV["GOROOT"] = "#{HOMEBREW_PREFIX}/opt/go/libexec"
    system "go", "env" # Debug env
    system "make", "gubiq"
    bin.install 'build/bin/gubiq'
  end

  test do
    system "#{HOMEBREW_PREFIX}/bin/gubiq", "--version"
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>ThrottleInterval</key>
        <integer>300</integer>
        <key>ProgramArguments</key>
        <array>
            <string>#{opt_bin}/gubiq</string>
            <string>-datadir=#{prefix}/.gubiq</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end
