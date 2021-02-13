# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2e60d31559a6b1d7241e64e22c8e291216f12477"

DESCRIPTION="LMDB bindings for Common Lisp"
HOMEPAGE="https://github.com/antimer/lmdb"
SRC_URI="https://github.com/antimer/lmdb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivial-utf8
	dev-lisp/mgl-pax
	dev-lisp/bordeaux-threads
	dev-lisp/osicat
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/cffi
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :lmdb\/test/,$d' ${PN}.asd
		rm -r test
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
