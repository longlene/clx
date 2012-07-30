# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit enlightenment

DESCRIPTION="Eet is primarily a data encoding, decoding and storage library."
HOMEPAGE="http://enlightenment.org/p.php?p=about/efl/eet"
SRC_URI="http://download.enlightenment.org/releases/${P}.tar.bz2"

LICENSE="EDB"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

RDEPEND=""
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	media-libs/jpeg
	sys-libs/zlib"
