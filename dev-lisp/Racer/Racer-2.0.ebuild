# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3

DESCRIPTION="Racer is a knowledge representation system that implements a highly optimized tableau calculus for the description logic SRIQ"
HOMEPAGE="https://github.com/ha-mo-we/Racer"
SRC_URI="https://github.com/ha-mo-we/Racer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/aserve
	dev-lisp/flexi-streams
	dev-lisp/deflate
"
