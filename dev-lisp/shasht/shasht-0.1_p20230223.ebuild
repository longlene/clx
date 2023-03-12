# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="1f4f063b75a77c95eabcd6a41e18e4246cf87881"

DESCRIPTION="Common Lisp JSON reading and writing for the Kzinti"
HOMEPAGE="https://github.com/yitzchak/shasht"
SRC_URI="https://github.com/yitzchak/shasht/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-do
	dev-lisp/closer-mop
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem #:shasht\/test/,$d' \
		-i ${PN}.asd
	rm -rf tests
}
