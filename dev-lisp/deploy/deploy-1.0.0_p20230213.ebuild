# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="29a28f6f9c23360c7ede65d40c42687250b06e90"

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
	dev-lisp/documentation-utils
	dev-lisp/trivial-features
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test.lisp
}
