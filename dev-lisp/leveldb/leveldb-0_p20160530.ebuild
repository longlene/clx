# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="66970cf05a4138cf9e57846cdb9b2cfcd67aab80"

DESCRIPTION="LevelDB bindings for Common Lisp"
HOMEPAGE="https://github.com/death/leveldb"
SRC_URI="https://github.com/death/leveldb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/babel
	dev-lisp/trivial-garbage
	dev-libs/leveldb
"
