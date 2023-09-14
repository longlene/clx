# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Trivial IRC client library for Common Lisp"
HOMEPAGE="https://github.com/karvus/trivial-irc/"
SRC_URI="https://github.com/karvus/trivial-irc/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
	dev-lisp/usocket
"
