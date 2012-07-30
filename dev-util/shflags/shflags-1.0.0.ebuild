# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Command-line flags module for Unix shell scripts"
HOMEPAGE="http://code.google.com/p/shflags/"
SRC_URI="http://shflags.googlecode.com/files/${P}.tgz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE="examples"

src_install() {
	dohtml README.html
	dodoc README.txt doc/CHANGES-1.0.txt doc/RELEASE_NOTES-1.0.0.txt
	dodoc doc/LGPL-2.1
	insinto /usr/lib/shflags
	doins src/shflags
	if use examples; then
		dodoc examples/hello_world.sh
	fi
}

src_test() {
	cd src
	./shflags_test.sh || die "shflags unit test has failed."
}
