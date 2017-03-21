# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

EGIT_COMMIT="34e31dbd26bf5da4fd86f2f77a0aebc4c583dda9"

DESCRIPTION="ZeroMQ Common Lisp bindings"
HOMEPAGE="https://github.com/orivej/pzmq"
SRC_URI="https://github.com/orivej/pzmq/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	net-libs/zeromq
"
