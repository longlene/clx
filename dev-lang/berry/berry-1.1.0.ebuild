# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Berry Script Language"
HOMEPAGE="https://github.com/berry-lang/berry"
SRC_URI="https://github.com/berry-lang/berry/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin berry
	einstalldocs
}
