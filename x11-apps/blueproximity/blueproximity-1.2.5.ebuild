# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Proximity detector for your mobile phone via bluetooth"
HOMEPAGE="http://blueproximity.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

IUSE=""
LANGS="de en es fa hu it ru sv th"

for l in ${LANGS};
do
	IUSE="${IUSE} linguas_${l}"
done

SLOT="0"

KEYWORDS="~x86 ~amd64"
DEPEND=""

RDEPEND="dev-python/pygobject
	dev-python/configobj
	dev-python/setuptools
	dev-python/pybluez
	>=dev-python/pygtk-2.0
	"

S="${WORKDIR}/${P}.orig"

src_install()
{
	sed -i -r "s:\`dirname \\\$PRG\`:/usr/lib/${PN}:" start_proximity.sh
	newbin start_proximity.sh blueproximity
	insinto "/usr/lib/${PN}"
	doins blueproximity*
	doins proximity*
	dodoc COPYING
	dodoc README
	dodoc ChangeLog
	doman doc/blueproximity.1
	dohtml doc/*
	insinto /usr/share/applications
	doins addons/blueproximity.desktop
	insinto /usr/share/pixmaps
	doins addons/blueproximity.xpm
	strip-linguas ${LANGS}
	for l in ${LINGUAS};
	do
		dodir "/usr/lib/${PN}/LANG/${l}"
		cp -r "${S}/LANG/${l}" "${D}/usr/lib/${PN}/LANG"
	done
}
