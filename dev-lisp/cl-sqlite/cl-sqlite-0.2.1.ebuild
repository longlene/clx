# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A CommonLisp interface to the SQLite embedded relational database engine."
HOMEPAGE="http://common-lisp.net/project/cl-sqlite/"
SRC_URI="https://github.com/dmitryvk/cl-sqlite/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	dev-lisp/cffi
	dev-lisp/iterate
	dev-db/sqlite:3
	test? ( dev-lisp/fiveam dev-lisp/bordeaux-threads )
"

src_prepare() {
	eapply_user
	use test || rm sqlite-tests.asd sqlite-tests.lisp
}

