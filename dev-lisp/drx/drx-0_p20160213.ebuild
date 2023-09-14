# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8c9bc913f0d370a69f8c008cad39b9520fc0a187"

DESCRIPTION="XDR serializer"
HOMEPAGE="https://github.com/fjames86/drx"
SRC_URI="https://github.com/fjames86/drx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/nibbles
	dev-lisp/babel
"
