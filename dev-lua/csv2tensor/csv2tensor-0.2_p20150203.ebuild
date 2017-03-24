# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="6f8f68b437ba3922d0e1bbf9d9fb10c92408c7ce"

DESCRIPTION="A simple utility to transform a CSV file into a Torch7 Tensor"
HOMEPAGE="https://github.com/willkurt/csv2tensor"
SRC_URI="https://github.com/willkurt/csv2tensor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
	dev-lua/csvigo
"

src_install() {
	lua_install_module csv2tensor.lua
	dodoc README.md
}
