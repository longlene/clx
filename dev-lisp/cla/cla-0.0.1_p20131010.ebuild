# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="939c459619fb99ac7554b8afa1e50019e227a6c5"

DESCRIPTION="An auth system for Common Lisp webapps"
HOMEPAGE="https://github.com/quasi/cla"
SRC_URI="https://github.com/quasi/cla/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clsql
	dev-lisp/ironclad
	dev-lisp/hunchentoot
	dev-lisp/cl-base64
	dev-lisp/babel
	dev-lisp/date-calc
	dev-lisp/pooler
"
