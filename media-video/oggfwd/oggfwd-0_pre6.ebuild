# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit bzr

# Bazaar source information
EBZR_REPO_URI="http://v2v.cc/~j/oggfwd"
EBZR_REVISION="6"
# Overwrite the branch - not the default trunk
EBZR_BRANCH=""

DESCRIPTION="Pipes an ogg stream to an icecast server"
HOMEPAGE="http://v2v.cc/~j/oggfwd/"
# empty SRC_URI to make it clear that this is a live ebuild.
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=media-libs/libshout-2.1
	media-libs/libogg
	media-libs/libvorbis
	media-libs/libtheora
	media-libs/speex"
RDEPEND="${DEPEND}"

src_install() {
	# First create the needed folders - compile fails if they are missing.
	dodir /usr/bin || die "creating necessary dir /usr/bin failed"
	# Then do the standard gentoo install
	emake PREFIX="${D}usr" install || die "Install failed"
}
