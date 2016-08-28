# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3

DESCRIPTION="A Common Lisp Interface to R"
HOMEPAGE="https://common-lisp.net/project/rcl/"
SRC_URI="https://common-lisp.net/project/rcl/rcl-${PV}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/R
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
"
