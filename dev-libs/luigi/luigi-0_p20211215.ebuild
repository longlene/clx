# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="6937363aafa3177f949430c396e004fca837e5b2"

DESCRIPTION="A barebones single-header GUI library for Win32, X11 and Essence"
HOMEPAGE="https://github.com/nakst/luigi"
SRC_URI="https://github.com/nakst/luigi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins luigi.h
	dodoc README.md
}
