# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3

DESCRIPTION="Common Lisp Erlang Interface"
HOMEPAGE="http://common-lisp.net/project/cleric"
SRC_URI="mirror://github/flambard/CLERIC/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/epmd
	dev-lisp/erlang-term
	dev-lisp/usocket
	dev-lisp/md5
	dev-lisp/alexandria
	dev-lisp/binary-data
"

src_prepare() {
	use test || rm -rf test cleric-test.asd
}
