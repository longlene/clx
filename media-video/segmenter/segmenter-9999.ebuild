# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

ESVN_REPO_URI="http://svn.assembla.com/svn/legend/segmenter"

inherit subversion eutils

DESCRIPTION="Open Source version of the Apple Segmenter."
HOMEPAGE="http://svn.assembla.com/svn/legend/segmenter"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-video/ffmpeg"
RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN}
	dodoc COPYING
}
