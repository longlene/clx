# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="33af1277fce204c4d72187ef1047932d0183ef9d"

DESCRIPTION="Automatic indentation for Common Lisp"
HOMEPAGE="https://github.com/yitzchak/cl-indentify"
SRC_URI="https://github.com/yitzchak/cl-indentify/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivial-gray-streams
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "cl-indentify\/tests",$d' \
		-i ${PN}.asd
	rm -rf tests
}
