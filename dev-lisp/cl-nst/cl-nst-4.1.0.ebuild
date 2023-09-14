# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3

DESCRIPTION="Unit testing for Common Lisp"
HOMEPAGE="https://github.com/jphmrst/cl-nst"
SRC_URI="https://github.com/jphmrst/cl-nst/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/org-sampler
"
