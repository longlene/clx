# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="1d592024398f06c8eda1d325bdbd105ac32d92b3"

DESCRIPTION="Constant-Time Toolkit"
HOMEPAGE="https://github.com/pornin/CTTK"
SRC_URI="https://github.com/pornin/CTTK/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins inc/cttk.h
	dolib.a build/libcttk.a
	dodoc README.md
}
