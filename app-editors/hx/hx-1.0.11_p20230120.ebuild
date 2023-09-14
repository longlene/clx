# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="e592e8c07577b003619ff1c5df431d1b8c0b68bb"

DESCRIPTION="Hex editor for the terminal"
HOMEPAGE="https://github.com/krpors/hx"
SRC_URI="https://github.com/krpors/hx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin hx
	doman hx.1
	einstalldocs
}
