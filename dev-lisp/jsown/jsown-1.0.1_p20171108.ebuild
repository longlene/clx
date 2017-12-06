# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d379396691a49dcb3d52348f624f25fc2deea869"

DESCRIPTION="high performance Common Lisp json parser"
HOMEPAGE="https://github.com/madnificent/jsown"
SRC_URI="https://github.com/madnificent/jsown/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r tests
}

