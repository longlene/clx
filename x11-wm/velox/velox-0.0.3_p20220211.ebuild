# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="fcc041265539befd907a64ee3a536cb2489ffb99"

DESCRIPTION="velox window manager"
HOMEPAGE="https://github.com/michaelforney/velox"
SRC_URI="https://github.com/michaelforney/velox/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-libs/pixman
	dev-libs/wayland
"
RDEPEND="${DEPEND}"
BDEPEND=""
