# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3 common-lisp-3

DESCRIPTION="Trivial lazy macros and functions for Common Lisp"
HOMEPAGE="https://github.com/dsorokin/trivial-lazy"
SRC_URI=""

EGIT_REPO_URI="https://github.com/dsorokin/trivial-lazy.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
