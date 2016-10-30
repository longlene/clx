# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="XDR serializer"
HOMEPAGE="https://github.com/fjames86/drx"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fjames86/drx.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/nibbles
	dev-lisp/babel
"
