# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2

DESCRIPTION="closure-common is a helper library for Closure and Closure XML implementing runes."
HOMEPAGE="http://www.cliki.net/closure-common"
SRC_URI="http://archimag-lisp-overlay.googlecode.com/files/${P}.tar.bz2"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/trivial-gray-streams"

