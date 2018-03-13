# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

DESCRIPTION="Header-only, event based, tiny and easy to use libuv wrapper in modern C++"
HOMEPAGE="https://github.com/skypjack/uvw"
SRC_URI="https://github.com/skypjack/uvw/archive/v1.7.0_libuv-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libuv
"

src_install() {
	insinto /usr/include
	doins -r src/uvw{,.hpp}
	dodoc README.md
}
