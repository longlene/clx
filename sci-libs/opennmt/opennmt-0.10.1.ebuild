# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

DESCRIPTION="Open-Source Neural Machine Translation in Torch"
HOMEPAGE="https://github.com/opennmt/opennmt"
SRC_URI="https://github.com/OpenNMT/OpenNMT/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch-nn
	sci-libs/torch-nngraph
	dev-lua/tds
	dev-lua/threads
"

src_install() {
	lua_install_module -r onmt
	insinto /usr/share/${PF}
	doins -r data tools preprocess.lua train.lua translate.lua tag.lua
	dodoc README.md
}

