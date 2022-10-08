# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A library for working with sets of tasks in parallel"
HOMEPAGE="https://github.com/facebookincubator/dispenso"
SRC_URI="https://github.com/facebookincubator/dispenso/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include/dispenso
	doins dispenso/*.h
	insinto /usr/include/dispenso/detail
	doins dispenso/detail/*.h
	dolib.so ${BUILDDIR}/dispenso/lib${PN}.so
	einstalldocs
}
