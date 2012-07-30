# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="ProFont programming font"
HOMEPAGE="http://www.tobias-jung.de/seekingprofont/"
SRC_URI="http://www.tobiasjung.net/dl/${PN}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 ppc s390 sh sparc x86"
IUSE="gzip"

DEPEND="gzip? ( app-arch/gzip )"
RDEPEND=""

S="${WORKDIR}/${PN}"
FONT_S=${S}
FONT_SUFFIX="pcf"

RESTRICT="mirror" 

src_compile() {
	cd "${FONT_S}"
	if use gzip; then
		gzip *.pcf
		export FONT_SUFFIX="pcf.gz"
	fi
}
