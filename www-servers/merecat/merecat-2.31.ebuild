# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Simple HTTP/HTTPS server"
HOMEPAGE="http://merecat.troglobit.com/"
SRC_URI="https://github.com/troglobit/merecat/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libconfuse
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
