# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3

DESCRIPTION="A minimal yet feature-rich Common Lisp test framework"
HOMEPAGE="https://github.com/vseloved/should-test"
SRC_URI="https://github.com/vseloved/should-test/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/osicat
	dev-lisp/rutils
"
