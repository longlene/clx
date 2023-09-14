# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A fast, memory efficient hash map for C++"
HOMEPAGE="https://github.com/greg7mdp/sparsepp"
SRC_URI="https://github.com/greg7mdp/sparsepp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r sparsepp
	dodoc README.md
}
