# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1e65ade2e846a0f8b3cef40f1c31a1fe9b0fd96c"

DESCRIPTION="An extensible and highly modular bot framework"
HOMEPAGE="https://github.com/Shirakumo/maiden"
SRC_URI="https://github.com/Shirakumo/maiden/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/deeds
	dev-lisp/verbose
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	dev-lisp/closer-mop
	dev-lisp/uuid
	dev-lisp/form-fiddle
	dev-lisp/lambda-fiddle
	dev-lisp/documentation-utils
"
