# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="11025f8776737b360b782ae9816f89b5bebebf0e"

DESCRIPTION="Common Lisp library for using SQL"
HOMEPAGE="https://github.com/ruricolist/cl-yesql"
SRC_URI="https://github.com/ruricolist/cl-yesql/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/postmodern
	dev-lisp/cl-ppcre
"
