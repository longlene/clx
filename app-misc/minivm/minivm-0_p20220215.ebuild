# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="541f8c02565fdf41aa32aada733b57931d2e40d2"

DESCRIPTION="A VM That is Dynamic and Fast"
HOMEPAGE="https://github.com/FastVM/minivm"
SRC_URI="https://github.com/FastVM/minivm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin minivm
	dodoc README.md
}
