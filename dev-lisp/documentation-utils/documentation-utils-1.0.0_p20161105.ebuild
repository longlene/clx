# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8744aff787019d9fac65b94efbd1a6c6af6d145b"

DESCRIPTION="A few simple tools to help you with documenting your library"
HOMEPAGE="https://github.com/Shinmera/documentation-utils"
SRC_URI="https://github.com/Shinmera/documentation-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-indent
"
