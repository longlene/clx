# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cb9e48758a51ddf3296b56c41ce0006617b00916"

DESCRIPTION=""
HOMEPAGE="https://github.com/sharplispers/parse-number"
SRC_URI="https://github.com/sharplispers/parse-number/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	if use !test ; then
		sed -e '/defsystem :parse-number\/tests/,$d' \
			-i ${PN}.asd
		rm tests.lisp
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
