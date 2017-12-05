# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2c6ccf80044b4ba60fccf74af0d21612cfcf3a17"

DESCRIPTION="Common Lisp bindings to GNU Readline library"
HOMEPAGE="https://mrkkrp.github.io/cl-readline/"
SRC_URI="https://github.com/mrkkrp/cl-readline/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-libs/readline
	dev-lisp/alexandria
	dev-lisp/cffi
"
