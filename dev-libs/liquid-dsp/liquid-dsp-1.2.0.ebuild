# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="digital signal processing library for software-defined radios"
HOMEPAGE="http://liquidsdr.org"
SRC_URI="https://github.com/quiet/liquid-dsp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
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
	econf --prefix="${D}"/usr
}
