# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="framebuffer grabber"
HOMEPAGE="http://jwilk.net/software/fbcat"
SRC_URI="https://github.com/jwilk/fbcat/archive/0.5.1.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin fbcat fbgrab
}
