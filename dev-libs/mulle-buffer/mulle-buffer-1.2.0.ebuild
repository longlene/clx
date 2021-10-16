# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A growable C char array and also a stream"
HOMEPAGE="https://github.com/mulle-c/mulle-buffer"
SRC_URI="https://github.com/mulle-c/mulle-buffer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/mulle-allocator
"
RDEPEND="${DEPEND}"
BDEPEND=""
