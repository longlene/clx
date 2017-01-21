# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fb97ec9d0e4d5ea3eef95116b7df971e48e41e76"

DESCRIPTION="A Common Lisp implementation of Message Pack"
HOMEPAGE="https://github.com/mbrezu/cl-messagepack"
SRC_URI="https://github.com/mbrezu/cl-messagepack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/flexi-streams
	dev-lisp/babel
	dev-lisp/cl-json
	dev-lisp/fiveam
	dev-lisp/closer-mop
"
