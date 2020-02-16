# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="d74ffc7157890fe1e16c09e3cb3e5103f5067720"

DESCRIPTION="A single-header ANSI C immediate mode cross-platform GUI library"
HOMEPAGE="https://github.com/Immediate-Mode-UI/nuklear"
SRC_URI="https://github.com/Immediate-Mode-UI/nuklear/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins nuklear.h
	dodoc Readme.md
}
