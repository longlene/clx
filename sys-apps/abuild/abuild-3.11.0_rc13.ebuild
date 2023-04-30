# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Build script to build Alpine packages"
HOMEPAGE="https://github.com/alpinelinux/abuild"
SRC_URI="https://gitlab.alpinelinux.org/alpine/abuild/-/archive/${PV}/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
