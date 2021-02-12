# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="38949223e9d67d0f8ae3052d2c7738b0c58ca973"

DESCRIPTION="An extended Common Lisp package to the general needs of other hu.dwim systems"
HOMEPAGE="https://github.com/hu-dwim/hu.dwim.common"
SRC_URI="https://github.com/hu-dwim/hu.dwim.common/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/closer-mop
	dev-lisp/hu_dwim_common-lisp
	dev-lisp/iterate
	dev-lisp/metabang-bind
"
BDEPEND=""
