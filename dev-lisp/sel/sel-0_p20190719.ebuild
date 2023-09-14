# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c015e5a4d56d3ffdb6b7f5cc20d31cb00f059192"

DESCRIPTION="Programmatic modification and evaluation of software"
HOMEPAGE="https://github.com/GrammaTech/sel"
SRC_URI="https://github.com/GrammaTech/sel/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/uiop
	dev-lisp/bordeaux-threads
	dev-lisp/arrow-macros
	dev-lisp/cl-json
	dev-lisp/cl-ppcre
	dev-lisp/cl-store
	dev-lisp/named-readtables
	dev-lisp/curry-compose-reader-macros
	dev-lisp/diff
	dev-lisp/elf
	dev-lisp/iterate
	dev-lisp/metabang-bind
	dev-lisp/split-sequence
	dev-lisp/usocket
	dev-lisp/babel
	dev-lisp/fast-io
	dev-lisp/trace-db
"
