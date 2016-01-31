# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

# Package name and version number for mimicdecoder
MY_PN="mimicdecoder"
MY_PV="1.0.1.1"

DESCRIPTION="Video decoding/converting tools for the codec used by msn"
HOMEPAGE="http://www.thegraveyard.org"
SRC_URI="http://thegraveyard.org/files/${PN}-${PV}.tar.gz
	mimicdecoder?	( http://thegraveyard.org/files/${MY_PN}-${MY_PV}.tar.gz )"
LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE="+mimicdecoder"
DEPEND="media-libs/libmimic
	mimicdecoder?	( media-video/transcode
			dev-python/PyQt )"

src_install() {
	make DESTDIR="${D}" PREFIX="usr" install || die "make install failed"
	use mimicdecoder && (
		cd ../${MY_PN}-${MY_PV}
		python ./setup.py install --root="${D}"
	)
}

pkg_postinst() {
echo
ewarn "IMPORTANT:"
ewarn "This is an unofficial ebuild for wxFormBuilder."
ewarn "If you encounter any problems, do NOT file bugs to gentoo"
ewarn "bugzilla."
}

