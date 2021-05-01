# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fd884f94b36ef5e9bc19459ad0b3cda6303d2a2a"

DESCRIPTION="Pure math functions useful for games, 3D, and GL in general"
HOMEPAGE="https://github.com/lispgames/mathkit"
SRC_URI="https://github.com/lispgames/mathkit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/sb-cga
"
