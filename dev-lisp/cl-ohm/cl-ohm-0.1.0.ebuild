# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="An object-hash mapping for Redis in Common Lisp"
HOMEPAGE="https://github.com/rudolfochrist/cl-ohm"
SRC_URI="https://github.com/rudolfochrist/cl-ohm/archive/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-redis
	dev-lisp/closer-mop
	test? ( dev-lisp/fiveam )
"
