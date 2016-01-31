# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="cpptoml is a header-only library for parsing TOML"
HOMEPAGE="https://github.com/skystrife/cpptoml"
SRC_URI="mirror://github/skystrife/cpptoml/archive/toml-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins include/cpptoml.h
	dodoc README.md
}
