# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Access variable arguments in struct layout fashion in C"
HOMEPAGE="https://github.com/mulle-c/mulle-vararg"
SRC_URI="https://github.com/mulle-c/mulle-vararg/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/mulle-c11
"
RDEPEND="${DEPEND}"
BDEPEND=""
