# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit common-lisp-3

#MY_P=${PN}_${PV}

DESCRIPTION="Archive is Nathan Froyd's tar/cpio package for CL."
HOMEPAGE="http://www.cliki.net/Archive"
SRC_URI="https://github.com/froydnj/archive/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

#S="${WORKDIR}"/${MY_P}
