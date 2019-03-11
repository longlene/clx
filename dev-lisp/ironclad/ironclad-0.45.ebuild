# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="Ironclad is a Common Lisp library similar to OpenSSL, GNU TLS or Crypto++"
HOMEPAGE="http://method-combination.net/lisp/ironclad/
		http://www.cliki.net/Ironclad"
SRC_URI="https://github.com/sharplispers/ironclad/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	dev-lisp/flexi-streams
	dev-lisp/nibbles
	dev-lisp/bordeaux-threads
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "ironclad\/tests/,$d' ${PN}.asd
		rm -r testing
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all LICENSE NEWS README.org TODO doc
}
