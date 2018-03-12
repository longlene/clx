# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="88bc69ccdb5f4176d9505ee89cc0e32dd413716e"

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
