# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="21965bd05747175fd1449e1615a9998591ded30c"

DESCRIPTION="Eliza program from PAIP"
HOMEPAGE="https://github.com/cl-aip/eliza"
SRC_URI="https://github.com/cl-aip/eliza/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="PAIP"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
