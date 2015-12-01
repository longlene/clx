# Copyright 2006-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit distutils

DESCRIPTION="PyGTK-based book reader for plain text, fb2 and other books"
HOMEPAGE="http://odin.sourceforge.net/"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~ia64 ~x86"
SRC_URI="mirror://sourceforge/odin/${P}.tar.bz2"
IUSE="ms-doc pdf"
DEPEND="dev-libs/libxml2
		dev-python/pygtk
		gnome-base/libglade"
RDEPEND="${DEPEND}
        ms-doc? ( app-text/catdoc )
		pdf? ( virtual/poppler )"
DOCS="README INSTALL"
