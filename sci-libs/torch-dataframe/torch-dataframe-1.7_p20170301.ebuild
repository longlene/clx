# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="8bc59c33e24bb99e890dab594d78be9fb32891b0"

DESCRIPTION="A Dataframe class for Torch"
HOMEPAGE="https://github.com/AlexMili/torch-dataframe/"
SRC_URI="https://github.com/AlexMili/torch-dataframe/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
	dev-lua/argcheck
	dev-lua/luafilesystem
	sci-libs/torch-paths
	sci-libs/torchnet
	dev-lua/threads
	dev-lua/tds
	sci-libs/torch-nn
"

src_install() {
	insinto $(lua_get_sharedir)/Dataframe
	doins -r init.lua argcheck.lua doc.lua dataframe dataseries doc helper_classes sub_classes utils
	dodoc README.md
}
