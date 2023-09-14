# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A cargo-like buildsystem and package manager for C/C++"
HOMEPAGE="https://github.com/SanderMertens/bake"
SRC_URI="https://github.com/SanderMertens/bake/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake -C build-Linux
}

src_install() {
	dobin bake
	dodoc README.md
}
