# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b57ba7f5cf449fc07c0ccc86dbcc38daa5b88be0"

DESCRIPTION="RSS, Atom and general feed parsing and generating"
HOMEPAGE="https://github.com/Shinmera/feeder"
SRC_URI="https://github.com/Shinmera/feeder/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/plump
	dev-lisp/local-time
	dev-lisp/documentation-utils
"
BDEPEND=""
