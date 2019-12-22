# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools vcs-snapshot

MY_PV=${PV//./-}

DESCRIPTION="Asynchronous Network Library"
HOMEPAGE="http://asio.sourceforge.net/"
#SRC_URI="mirror://sourceforge/${PN}/${PN}/${P}.tar.bz2"
SRC_URI="https://github.com/chriskohlhoff/asio/archive/asio-${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="alpha amd64 ~arm ~arm64 ~hppa ia64 ppc ppc64 sparc x86"
IUSE="ssl"

RDEPEND="ssl? ( dev-libs/openssl )"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}/asio"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_with ssl openssl)
}

#src_install() {
#	default
#
#	if use examples; then
#		dodoc -r src/examples
#		docompress -x /usr/share/doc/${PF}/examples
#	fi
#}
