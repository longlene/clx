# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator zproduct

MY_PN="FriendlyAlbum"
MY_PV="$(replace_all_version_separators '-' )"
# upstream has been notified about the tarbz filename as of jan.4/07
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Plone 2.1 photo album product developed to be user friendly and efficient"
HOMEPAGE="http://plone.org/products/friendlyalbum/"
SRC_URI="http://plone.org/products/friendlyalbum/releases/${MY_PV}/${MY_P}-tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=net-zope/plone-2.1"
RDEPEND="${DEPEND}
         dev-python/simplejson"

ZPROD_LIST="${MY_PN}"

src_unpack() {
	#cd ${WORKDIR}
	tar xzf "${DISTDIR}/${A}"  || die "unpacking failed"
	mv "${MY_PN}-${PV}" "${MY_PN}" # rename to remove version tag
}
