# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="44a4a4c42c23e8c49f47db0cab0fa3b65bb18dfe"

DESCRIPTION="Medley Interlisp virtual machine"
HOMEPAGE="https://github.com/Interlisp/maiko"
SRC_URI="https://github.com/Interlisp/maiko/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ${BUILD_DIR}/{lde,ldex}
	einstalldocs
}
