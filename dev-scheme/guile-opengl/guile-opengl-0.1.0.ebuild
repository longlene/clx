# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="A library providing access to the OpenGL graphics API from GNU Guile"
HOMEPAGE="https://www.gnu.org/software/guile-opengl/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

DEPEND="
	media-libs/freeglut
"
RDEPEND="${DEPEND}"
