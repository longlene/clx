# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="UTF8-16-32 analysis, conversion, classification library"
HOMEPAGE="https://github.com/mulle-c/mulle-utf"
SRC_URI="https://github.com/mulle-c/mulle-utf/archive/2.0.11.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/mulle-allocator
"
RDEPEND="${DEPEND}"
BDEPEND=""
