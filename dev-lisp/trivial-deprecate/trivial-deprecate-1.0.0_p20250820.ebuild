# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="30a6385281d224760e687dc3fd7b9a0c276825a2"

inherit common-lisp-3

DESCRIPTION="A library implementing a simple deprecation mechanism"
HOMEPAGE="https://codeberg.org/shinmera/trivial-deprecate"
SRC_URI="https://codeberg.org/shinmera/trivial-deprecate/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
"
BDEPEND=""

S="${WORKDIR}"/${PN}

