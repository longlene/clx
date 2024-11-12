# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8af82fc7076b6264eef0706ddd1e283ad7707d0c"

DESCRIPTION="Deployment tools for standalone Common Lisp applications"
HOMEPAGE="https://github.com/Shinmera/deploy"
SRC_URI="https://github.com/Shinmera/deploy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/sha3
	dev-lisp/documentation-utils
	dev-lisp/trivial-features
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd test.lisp
}
