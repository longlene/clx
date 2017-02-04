# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="80bb79f3386a3e7c39d17aeff48057a3e3c471bc"

DESCRIPTION="Common Lisp temporary file creation library"
HOMEPAGE="https://github.com/hanshuebner/temporary-file"
SRC_URI="https://github.com/hanshuebner/temporary-file/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/cl-fad
	dev-lisp/cl-ppcre
	dev-lisp/unit-test
"
