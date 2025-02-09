# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="52826b69e0525e09a74d882db00837f064bb8691"

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
