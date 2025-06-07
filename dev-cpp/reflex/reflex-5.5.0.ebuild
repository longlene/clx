# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A high-performance C++ regex library and lexical analyzer generator with Unicode support"
HOMEPAGE="
	https://github.com/Genivia/RE-flex
	https://www.genivia.com/doc/reflex/html
"
SRC_URI="https://github.com/Genivia/RE-flex/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/RE-flex-${PV}
