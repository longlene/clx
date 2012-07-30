# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils versionator
SOURCE_PV=$(replace_version_separator 2 '-')
UNPACK_PV=$(get_version_component_range 1-2)

DESCRIPTION="A modern notification system, similar to libnotify or Growl on OSX"
HOMEPAGE="http://www.mumbles-project.org/"
SRC_URI="mirror://sourceforge/${PN}/${PN}_${SOURCE_PV}.tar.gz"
S="${WORKDIR}/${PN}-${UNPACK_PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#Depends: python-glade2

RDEPEND="	>=dev-python/pygtk-2.8
		dev-python/pycairo
		dev-python/dbus-python"
DEPEND="	dev-python/setuptools"

src_unpack() {
    unpack ${A}
    cd "${S}"
    sed -i -e 's@"/usr/share/python-support/mumbles/src/"@"/usr/lib/python2.5/site-packages/src/"@' \
	bin/mumbles bin/mumbles-send || die "sed failed"
}
