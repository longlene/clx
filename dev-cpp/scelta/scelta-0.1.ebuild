# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Syntactic sugar for variant and optional types"
HOMEPAGE="https://github.com/vittorioromeo/scelta"
SRC_URI="https://github.com/vittorioromeo/scelta/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/scelta{,.hpp}
	einstalldocs
}
