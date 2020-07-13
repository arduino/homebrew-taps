class Petname < Formula
  desc "An RFC1178 implementation to generate pronounceable, sometimes even memorable, pet names"
  homepage "https://github.com/dustinkirkland/petname"
  head "https://github.com/dustinkirkland/petname.git"
  license "Apache Licence 2.0"

  def install
    # replace DIR with Homebrew provided folder
    inreplace "usr/bin/petname", '[ -d "$SNAP/share/$PKG" ] && DIR="$SNAP/share/$PKG" || DIR="/usr/share/$PKG"', "DIR=\"#{share}/$PKG\""
    bin.install "usr/bin/petname"

    # install dicts
    (share).install "usr/share/petname"

    # install man files
    man1.install "usr/share/man/man1/petname.1"
  end

  test do
    system "petname"
  end
end
