# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b040e97578f3027d7d8c7652c74917726574c43e"

DESCRIPTION="Assembler with input in the form of standard instances"
HOMEPAGE="https://github.com/robert-strandh/Cluster"
SRC_URI="https://github.com/robert-strandh/Cluster/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="as-is"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/split-sequence
	dev-lisp/acclimation
"
