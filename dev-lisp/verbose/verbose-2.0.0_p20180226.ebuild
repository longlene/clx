# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e24a9a806db265e39d0e564abffc51f891446fd2"

DESCRIPTION="A Common Lisp logging framework using the piping library"
HOMEPAGE="https://shinmera.github.io/verbose"
SRC_URI="https://github.com/Shinmera/verbose/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/piping
	dev-lisp/local-time
	dev-lisp/bordeaux-threads
	dev-lisp/split-sequence
	dev-lisp/cl-fad
	dev-lisp/clon
"
