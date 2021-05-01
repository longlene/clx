# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Lisp block storage"
HOMEPAGE="https://github.com/fjames86/pounds"
SRC_URI="https://github.com/fjames86/pounds/archive/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-gray-streams
	dev-lisp/nibbles
	dev-lisp/babel
	dev-lisp/bordeaux-threads
"
