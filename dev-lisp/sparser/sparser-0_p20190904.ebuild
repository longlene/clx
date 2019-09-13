# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dce1a72a54d179f231316f5593d1257e5ed1469f"

DESCRIPTION="A natural language understanding system for English"
HOMEPAGE="https://github.com/ddmcdonald/sparser"
SRC_URI="https://github.com/ddmcdonald/sparser/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-dot
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :sparser\/tests/,/do-tests/d' ${PN}.asd
		rm -r test
	fi
}

