# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="35140aa0d56c36868323d266655501eb279773b7"

DESCRIPTION="a lua framework for queueing jobs using redis-async"
HOMEPAGE="https://github.com/ocallaco/redis-queue"
SRC_URI="https://github.com/ocallaco/redis-queue/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch-sys
	dev-lua/async
	dev-lua/redis-async
	dev-lua/redis-status
"

src_install() {
	insinto $(lua_get_sharedir)/redis-queue
	doins -r {init,monitor,config,common,queuefactory}.lua queues
	dodoc README.md
}
