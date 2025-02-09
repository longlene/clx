# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c7e057b3e69e58a909c173ce967ca04da50757a5"

DESCRIPTION="Common Lisp string manipulation library"
HOMEPAGE="https://github.com/vindarel/cl-str"
SRC_URI="https://github.com/vindarel/cl-str/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/cl-change-case
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -r ${PN}.test.asd test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
