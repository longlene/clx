# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit eutils
MY_PN="xulrunner"

SRC_BASE="https://ftp.mozilla.org/pub/mozilla.org/xulrunner/releases/${PV}/runtimes/${MY_PN}-${PV}.en-US.linux"

DESCRIPTION="A Mozilla runtime package"
HOMEPAGE="https://developer.mozilla.org/"
SRC_URI="
	amd64? ( ${SRC_BASE}-x86_64.tar.bz2 )
	x86? ( ${SRC_BASE}-i686.tar.bz2 )"

LICENSE="MPL-2.0 GPL-2 LGPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""

S=${WORKDIR}/"${MY_PN}"

src_install() {
	local dest=/opt/${MY_PN}

	insinto ${dest}
	doins -r chrome components dictionaries icons
	doins *.ini *.so *.gif *.*

	exeinto ${dest}
	doexe crashreporter mozilla-xremote-client plugin-container precomplete updater xulrunner xulrunner-stub

	dodir /opt/bin
	dosym /opt/bin/xulrunner ${dest}/xulrunner
}
