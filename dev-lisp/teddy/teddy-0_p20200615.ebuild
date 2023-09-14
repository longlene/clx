# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8e46ed3a29d528bc460d9f6fb568ce8fd21c9da7"

DESCRIPTION="A data framework for Common Lisp"
HOMEPAGE="https://github.com/40ants/teddy"
SRC_URI="https://github.com/40ants/teddy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hu_dwim_def
	dev-lisp/cl-ascii-table
	dev-lisp/list-of
	dev-lisp/rutils
	dev-lisp/alexandria
	dev-lisp/simplified-types
	dev-lisp/eazy-gnuplot
	dev-lisp/lhstats
"
BDEPEND=""
