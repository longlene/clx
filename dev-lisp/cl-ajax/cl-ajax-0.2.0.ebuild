# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3

DESCRIPTION="Common Lisp library to allow for remote invocation of functions through Javascript"
HOMEPAGE="http://www.holygoat.co.uk/projects/cl-ajax/"
SRC_URI="http://www.holygoat.co.uk/projects/cl-ajax/cl-ajax_${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/araneida
"

S="${WORKDIR}"/${PN}_${PV}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all doc/*.html
}
