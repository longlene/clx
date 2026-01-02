# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="3949563b73c188820291541703e27df6191112a8"

inherit common-lisp-3

DESCRIPTION="Toolkit to render stuff in plaintext"
HOMEPAGE="https://codeberg.org/shinmera/text-draw"
SRC_URI="https://codeberg.org/shinmera/text-draw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
BDEPEND=""

S="${WORKDIR}"/${PN}
