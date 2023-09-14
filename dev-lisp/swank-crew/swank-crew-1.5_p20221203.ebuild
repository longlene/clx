# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="af5a78678247cdceec79c9c58c238a9a735de2f9"

DESCRIPTION="Common Lisp distributed computation framework implemented using Swank Client"
HOMEPAGE="https://github.com/brown/swank-crew"
SRC_URI="https://github.com/brown/swank-crew/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/base
	dev-lisp/bordeaux-threads
	dev-lisp/swank-client
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem swank-crew\/test/,$d' \
		-i ${PN}.asd
	rm ${PN}-test.lisp
}
