# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6bc80876b35b8bfd70575d3b779a4e496c463c9d"

DESCRIPTION="Simple File Synchronization Tool"
HOMEPAGE="https://github.com/cbeo/tote"
SRC_URI="https://github.com/cbeo/tote/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ironclad
	dev-lisp/cl-store
	dev-lisp/flexi-streams
	dev-lisp/chipz
	dev-lisp/salza2
	dev-lisp/cl-ppcre
	dev-lisp/named-readtables
	dev-lisp/clon
"
BDEPEND=""
