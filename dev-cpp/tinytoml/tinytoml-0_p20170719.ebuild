# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit vcs-snapshot

EGIT_COMMIT="c2444edd7bba25b7258678252c83996cbf04761e"

DESCRIPTION="A header only C++11 library for parsing TOML"
HOMEPAGE="https://github.com/mayah/tinytoml"
SRC_URI="https://github.com/mayah/tinytoml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr
	doins -r include
	dodoc README.md
}
