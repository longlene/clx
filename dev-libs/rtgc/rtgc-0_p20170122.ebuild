# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="08a42fd3580c9ac9ad9c9d4a48928bf86aa5308c"

DESCRIPTION="Real time garbage collector"
HOMEPAGE="https://github.com/wadehennessey/rtgc"
SRC_URI="https://github.com/wadehennessey/rtgc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake lib
}

src_install() {
	dolib.so librtgc.so
	insinto /usr/include
	doins allocate.h
	dodoc doc/rtgc-slides.pdf
}
