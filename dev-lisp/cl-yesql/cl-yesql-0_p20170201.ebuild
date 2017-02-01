# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="08a4df3c12ad49ff0432cda4873d09bebd93087b"

DESCRIPTION="Common Lisp library for using SQL"
HOMEPAGE="https://github.com/TBRSS/cl-yesql"
SRC_URI="https://github.com/TBRSS/cl-yesql/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/postmodern
	dev-lisp/cl-ppcre
"
