# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

SRC_URI="https://github.com/lwes/lwes/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}
