# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="526541b2896517b821f2a47baa35c6359b14150f"

DESCRIPTION="Hprose for C++"
HOMEPAGE="https://github.com/hprose/hprose-cpp"
SRC_URI="https://github.com/hprose/hprose-cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r hprose
	dodoc README.md
}
