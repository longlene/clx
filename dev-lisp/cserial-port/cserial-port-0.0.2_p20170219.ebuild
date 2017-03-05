# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d588e63ca538667e365c09a192e1b6129020bbfd"

DESCRIPTION="serial-port accessing library for Common Lisp"
HOMEPAGE="https://github.com/snmsts/cserial-port"
SRC_URI="https://github.com/snmsts/cserial-port/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/trivial-gray-streams
	dev-lisp/osicat
"
