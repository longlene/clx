# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d8ddda7514e12f35510a32399f18e2b26ec69ddc"

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
