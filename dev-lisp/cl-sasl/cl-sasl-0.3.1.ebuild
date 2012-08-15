# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2

MY_P=${PN}_${PV}

DESCRIPTION="SASL client implementation for Common Lisp"
HOMEPAGE="http://www.dtek.chalmers.se/~henoch/text/cl-sasl.html
	http://www.cliki.net/cl-sasl"
SRC_URI="http://www.dtek.chalmers.se/~henoch/text/${PN}/${MY_P}.tar.gz"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/ironclad"

S="${WORKDIR}"/${MY_P}
