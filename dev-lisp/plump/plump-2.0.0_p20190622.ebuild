# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="16f1231bf706cfbc54d9e55a853ca945e4452a08"

DESCRIPTION="Practically Lenient and Unimpressive Markup Parser for Common Lisp"
HOMEPAGE="https://github.com/Shinmera/plump"
SRC_URI="https://github.com/Shinmera/plump/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/array-utils
	dev-lisp/documentation-utils
	dev-lisp/trivial-indent
	dev-lisp/array-utils
"
