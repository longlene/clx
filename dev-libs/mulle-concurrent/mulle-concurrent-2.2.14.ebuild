# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A lock- and wait-free hashtable (and an array too), written in C"
HOMEPAGE="https://github.com/mulle-concurrent/mulle-concurrent"
SRC_URI="https://github.com/mulle-concurrent/mulle-concurrent/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/mulle-aba
"
RDEPEND="${DEPEND}"
BDEPEND=""
