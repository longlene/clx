# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="An extensible sprintf function supporting stdarg and mulle-vararg"
HOMEPAGE="https://github.com/mulle-core/mulle-sprintf"
SRC_URI="https://github.com/mulle-core/mulle-sprintf/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/mulle-thread
	dev-libs/mulle-buffer
	dev-libs/mulle-utf
	dev-libs/mulle-vararg
"
RDEPEND="${DEPEND}"
BDEPEND=""
