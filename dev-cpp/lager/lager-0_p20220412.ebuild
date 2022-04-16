# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="9ae6527703de3a5514da8d7cb08a6678155ab9c5"

DESCRIPTION="Redux for C++"
HOMEPAGE="https://github.com/arximboldi/lager"
SRC_URI="https://github.com/arximboldi/lager/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r lager
	dodoc README.rst
}
