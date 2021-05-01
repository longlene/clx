# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6791f3569acd42b723ce82051cc8e2e3ee42a671"

DESCRIPTION="Persistent, fast mmap'd database for Common Lisp using MOP; includes its own GC systems"
HOMEPAGE="https://github.com/ilitirit/manardb"
SRC_URI="https://github.com/ilitirit/manardb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/osicat
	dev-lisp/iterate
	dev-lisp/closer-mop
	dev-lisp/cl-irregsexp
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}
