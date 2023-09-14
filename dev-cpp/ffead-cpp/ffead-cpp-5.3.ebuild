# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Framework for Enterprise Application Development"
HOMEPAGE="https://github.com/sumeetchhetri/ffead-cpp"
SRC_URI="https://github.com/sumeetchhetri/ffead-cpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf --enable-apachemod=yes
}

src_compile() {
	emake -j 1
}
