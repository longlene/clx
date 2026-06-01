# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3

DESCRIPTION="Racer is a knowledge representation system that implements a highly"
HOMEPAGE="https://github.com/ha-mo-we/Racer"
SRC_URI="https://github.com/ha-mo-we/Racer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
	dev-lisp/aserve
	dev-lisp/flexi-streams
	dev-lisp/deflate
"
