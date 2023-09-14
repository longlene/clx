# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1c1d672a01a446ba0391dbb4ffc40be3b0476f23"

DESCRIPTION="Stat a file's size in Common Lisp"
HOMEPAGE="https://github.com/ruricolist/trivial-file-size"
SRC_URI="https://github.com/ruricolist/trivial-file-size/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "trivial-file-size\/,$d' ${PN}.asd
		rm -r tests
	fi
}
