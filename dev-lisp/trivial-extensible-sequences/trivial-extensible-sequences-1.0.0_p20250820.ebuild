# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="410441140d012293b4ea131450c692b089c14406"

inherit common-lisp-3

DESCRIPTION="Portability library for the extensible sequences protocol"
HOMEPAGE="https://codeberg.org/shinmera/trivial-extensible-sequences"
SRC_URI="https://codeberg.org/shinmera/trivial-extensible-sequences/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}
