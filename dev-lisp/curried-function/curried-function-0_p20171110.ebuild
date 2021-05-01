# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="652368287608f360d84fd2a8fffe11ad60212c6f"

DESCRIPTION="Common Lisp extension about curried function"
HOMEPAGE="https://github.com/hyotang666/curried-function"
SRC_URI="https://github.com/hyotang666/curried-function/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	test? ( dev-lisp/jingoh dev-lisp/introspect-environment )
"

src_prepare() {
	eapply_user
	use test || rm -r spec
}
