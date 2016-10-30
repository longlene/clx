# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Common Lisp DNS client"
HOMEPAGE="https://github.com/fjames86/dragons"
SRC_URI="https://github.com/fjames86/dragons/archive/dns-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fsocket
	dev-lisp/drx
	dev-lisp/nibbles
	dev-lisp/babel
	dev-lisp/pounds
"
