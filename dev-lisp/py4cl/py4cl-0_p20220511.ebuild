# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b019b0c20b40fb65d295c9d0545674454c99c5da"

DESCRIPTION="Call python from Common Lisp"
HOMEPAGE="https://github.com/bendudson/py4cl/"
SRC_URI="https://github.com/bendudson/py4cl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-garbage
	test? ( dev-lisp/clunit )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "py4cl\/tests"/,$d' ${PN}.asd
		rm -r tests
	fi
}

