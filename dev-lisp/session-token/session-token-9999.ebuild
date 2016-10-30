# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A simple custom alphabet session-token generator built on top of the ISAAC CSPRNG"
HOMEPAGE="https://github.com/Inaimathi/session-token"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Inaimathi/session-token.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-isaac
"
