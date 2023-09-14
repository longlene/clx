# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0aeda96d39cce6e5466a21ad1293b5225cfbbb51"

DESCRIPTION="Simple communications with swank servers for creating REPLs"
HOMEPAGE="https://github.com/stacksmith/trivial-swank"
SRC_URI="https://github.com/stacksmith/trivial-swank/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-utf8
"
