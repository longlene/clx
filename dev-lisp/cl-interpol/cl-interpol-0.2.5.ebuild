# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3

DESCRIPTION="String interpolation for Common Lisp similar to Perl or Unix shell scripts."
HOMEPAGE="http://weitz.de/cl-interpol/
		http://www.cliki.net/cl-interpol"
SRC_URI="https://github.com/edicl/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/cl-unicode
		dev-lisp/flexi-streams"
