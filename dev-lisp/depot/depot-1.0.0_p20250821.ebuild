# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="6b46c7d85475bb3869589a73fa7dce8614e6f2f7"

inherit common-lisp-3

DESCRIPTION="Protocol for transparent collections of files"
HOMEPAGE="https://codeberg.org/shinmera/depot"
SRC_URI="https://codeberg.org/shinmera/depot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/trivial-features
	dev-lisp/trivial-gray-streams
"
BDEPEND=""

S="${WORKDIR}"/${PN}
