# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cc56c1bdb9b831c33addb2d7616da01b4c082b1e"

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
