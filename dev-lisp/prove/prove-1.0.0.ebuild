# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3

DESCRIPTION="Yet another unit testing framework for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/prove"
SRC_URI="https://github.com/fukamachi/prove/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
dev-lisp/cl-ansi-text
dev-lisp/alexandria
"
