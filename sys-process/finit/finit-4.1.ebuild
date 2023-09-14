# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Fast init for Linux systems"
HOMEPAGE="http://troglobit.com/finit.html"
SRC_URI="https://github.com/troglobit/finit/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libuev
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
