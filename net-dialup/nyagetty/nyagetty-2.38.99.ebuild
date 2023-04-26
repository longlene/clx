# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Standalone version of the agetty(8) program"
HOMEPAGE="https://github.com/chimera-linux/nyagetty"
SRC_URI="https://github.com/chimera-linux/nyagetty/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="0BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
