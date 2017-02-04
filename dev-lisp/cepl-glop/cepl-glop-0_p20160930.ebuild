# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b62c7c059296032d7f1ce0a55383f5f3c3b689e2"

DESCRIPTION="glop host for cepl"
HOMEPAGE="https://github.com/cbaggers/cepl.glop"
SRC_URI="https://github.com/cbaggers/cepl.glop/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cepl
	dev-lisp/glop
"
