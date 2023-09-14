# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Lightweight cross-platform clipboard library"
HOMEPAGE="https://github.com/jtanx/libclipboard"
SRC_URI="https://github.com/jtanx/libclipboard/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/libxcb
"
RDEPEND="${DEPEND}"
BDEPEND=""
