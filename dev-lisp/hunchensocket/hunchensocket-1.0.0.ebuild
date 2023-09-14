# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3

DESCRIPTION="WebSockets for Hunchentoot"
HOMEPAGE="https://github.com/capitaomorte/hunchensocket"
SRC_URI="https://github.com/capitaomorte/hunchensocket/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/hunchentoot
dev-lisp/alexandria
dev-lisp/ironclad
dev-lisp/flexi-streams
dev-lisp/chunga
dev-lisp/trivial-utf8
dev-lisp/trivial-backtrace
dev-lisp/bordeaux-threads
dev-lisp/cl-fad
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all VERSION
}
