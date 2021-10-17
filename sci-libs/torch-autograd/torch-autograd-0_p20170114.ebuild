# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="4bc278a4169e13b928b54ef5c4a723267c6e0a04"

DESCRIPTION="Automatic differentiation for Torch"
HOMEPAGE="https://github.com/twitter/torch-autograd"
SRC_URI="https://github.com/twitter/torch-autograd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sci-libs/torch7
"
RDEPEND="${DEPEND}"

src_install() {
	insinto $(lua_get_sharedir)/autograd
	doins -r src/*
	dodoc README.md
}
