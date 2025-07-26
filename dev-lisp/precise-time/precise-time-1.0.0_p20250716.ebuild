# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="86977d983fd784a1899a3933375ed815fa509db4"

DESCRIPTION="Precise time measurements"
HOMEPAGE="https://github.com/Shinmera/precise-time"
SRC_URI="https://github.com/Shinmera/precise-time/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-features
	dev-lisp/documentation-utils
	dev-lisp/cffi
"
BDEPEND=""

src_prepare() {
	default
	if use !test; then
		sed -e '/defsystem precise-time\/test/,$d' \
			-i ${PN}.asd
		rm test.lisp
	fi
}
