# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="An implementation of RFC 2388 in Common Lisp"
HOMEPAGE="http://common-lisp.net/project/rfc2388/"
SRC_URI="http://common-lisp.net/project/${PN}/${PN}_${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}"

S="${WORKDIR}"/${PN}
