# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="19bf7da400ba0150a4d293fa837bc95913b02e28"

inherit common-lisp-3

DESCRIPTION="Open a file in a suitable external program"
HOMEPAGE="https://codeberg.org/shinmera/open-with"
SRC_URI="https://codeberg.org/shinmera/open-with/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/trivial-features
"
BDEPEND=""

S="${WORKDIR}"/${PN}
