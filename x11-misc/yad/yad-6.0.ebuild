# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Yet Another Dialog"
HOMEPAGE="https://github.com/v1cont/yad"
SRC_URI="https://github.com/v1cont/yad/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-libs/gtk+"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}
