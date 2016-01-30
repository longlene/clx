# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit distutils

DESCRIPTION="mms stream downloader that uses libmms"
HOMEPAGE="http://savannah.nongnu.org/projects/mimms/"
SRC_URI="http://savannah.nongnu.org/download/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND="media-libs/libmms"
RDEPEND="${DEPEND}"
NEED_PYTHON="2.5"
