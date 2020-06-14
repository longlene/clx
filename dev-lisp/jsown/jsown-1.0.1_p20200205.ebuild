# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="744c4407bef58dfa876d9da0b5c0205d869e7977"

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

