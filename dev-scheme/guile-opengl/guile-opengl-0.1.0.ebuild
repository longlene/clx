# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A library providing access to the OpenGL graphics API from GNU Guile"
HOMEPAGE="https://www.gnu.org/software/guile-opengl/"
SRC_URI="http://ftp.gnu.org/gnu/${PN}/${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	media-libs/freeglut
"
RDEPEND="${DEPEND}"
