# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Hamachi-GUI is a free, fully functional GTK-interface for hamachi"
HOMEPAGE="http://hamachi-gui.sourceforge.net/"
MY_P="${PN}_${PV}"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

LANGS="bg de es fr it no pl sk sv"

for X in ${LANGS} ; do
	IUSE="${IUSE} linguas_${X}"
done


DEPEND="net-misc/hamachi
	x11-libs/gtk+"
RDEPEND="${DEPEND}"

src_compile() {
	econf
	emake || die "emake failed"
}

src_install() {
emake DESTDIR="${D}" install

for x in `ls ${D}/usr/share/locale/` ; do
	USELANG=""
	for y in ${LINGUAS} ; do
		[[ ${x} == ${y} ]]  && USELANG="yes"
	done

	[[ ${USELANG} != "yes" ]] && rm -r ${D}/usr/share/locale/${x}
done
}
