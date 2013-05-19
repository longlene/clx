# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


MY_P="sq3.9-7067web07.11.1"
DESCRIPTION="Squeak web developer image file"
HOMEPAGE="http://www.squeak.org/"
SRC_URI="http://squeak.ofset.org/squeak-web/${MY_P}.zip
		http://ftp.squeak.org/current_stable/SqueakV3.sources.gz"

LICENSE="Apple"
SLOT="3.9"
KEYWORDS="~x86 ~amd64"
IUSE=""
PROVIDE="virtual/squeak-image"

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"

src_compile() {
	einfo "Compressing image/changes files."
	gzip ${MY_P}full.image
	gzip ${MY_P}full.changes
	einfo "done."
}

src_install() {
	einfo 'Installing Image/Sources/Changes files.'
	dodoc ReadMe.txt
	insinto /usr/lib/squeak
	# install full image and changes file.
	doins ${MY_P}.image.gz
	doins ${MY_P}.changes.gz
	# install sources
	doins SqueakV3.sources
	# create symlinks to the changes and image files.
	dosym /usr/lib/squeak/${MY_P}.changes.gz \
		/usr/lib/squeak/squeak.changes.gz
	dosym /usr/lib/squeak/${MY_P}.image.gz \
		/usr/lib/squeak/squeak.image.gz
}

pkg_postinst() {
	elog "Squeak ${PV} image, changes and sources files installed in /usr/lib/squeak"
}
