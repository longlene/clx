# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Public domain cross-platform semantic versioning"
HOMEPAGE="https://github.com/uael/sv"
SRC_URI="https://github.com/uael/sv/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
