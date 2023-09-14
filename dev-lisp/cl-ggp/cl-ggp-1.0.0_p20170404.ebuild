# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="08e1849c6f7c92d9eb9b8ead31ee210d460af992"

DESCRIPTION="A framework for writing General Game Playing clients"
HOMEPAGE="https://bitbucket.org/sjl/cl-ggp/"
SRC_URI="https://github.com//sjl/cl-ggp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/flexi-streams
	dev-lisp/optima
	dev-lisp/fare-quasiquote-optima
	dev-lisp/fare-quasiquote-readtable
"
