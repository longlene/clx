# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit autotools

DESCRIPTION="Functional reactive game programming in GNU Guile Scheme"
HOMEPAGE="https://dthompson.us/pages/software/sly.html"
SRC_URI="http://files.dthompson.us/sly/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	>=dev-scheme/guile-sdl-0.5.0
	>=dev-scheme/guile-opengl-0.1.0
	>=media-libs/freeimage-3.0
	sci-libs/gsl
"
RDEPEND="${DEPEND}"

