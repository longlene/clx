#Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Build script to build Alpine packages"
HOMEPAGE="https://github.com/alpinelinux/abuild"
SRC_URI="https://github.com/alpinelinux/abuild/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
