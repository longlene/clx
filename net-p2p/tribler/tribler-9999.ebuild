# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.5"

inherit eutils python subversion

DESCRIPTION="Python based Bittorrent/Internet TV application"
HOMEPAGE="http://www.tribler.org/"
SRC_URI=""
ESVN_REPO_URI="http://svn.tribler.org/abc/branches/release-5.5.x/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="vlc"

RDEPEND=">=dev-libs/openssl-0.9.8
	dev-python/apsw
	>=dev-python/m2crypto-0.16
	>=dev-python/wxpython-2.8
	vlc? ( media-video/vlc )"
DEPEND="${RDEPEND}"

src_install() {
	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins -r .
	dobin ${FILESDIR}/tribler
}

pkg_postinst() {
	python_mod_optimize "${ROOT}"usr/share/${PN}
}

pkg_postrm() {
	python_mod_cleanup "${ROOT}"usr/share/${PN}
}
