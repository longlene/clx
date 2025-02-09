# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="44713443502560443bf74fd888899b41d34e9859"

DESCRIPTION="Common Lisp CommonMark"
HOMEPAGE="https://github.com/myaosato/clcm"
SRC_URI="https://github.com/myaosato/clcm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	test? ( dev-lisp/cl-json )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "clcm\/test/,$d' ${PN}.asd
		rm -r src/test
	fi
}
