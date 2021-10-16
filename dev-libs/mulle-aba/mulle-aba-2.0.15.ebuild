# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A lock-free, cross-platform solution to the ABA problem, written in C"
HOMEPAGE="https://github.com/mulle-concurrent/mulle-aba"
SRC_URI="https://github.com/mulle-concurrent/mulle-aba/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/mulle-allocator
	dev-libs/mulle-thread
"
RDEPEND="${DEPEND}"
BDEPEND=""
