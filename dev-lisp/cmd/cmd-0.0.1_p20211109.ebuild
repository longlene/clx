# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a792a2bcca62216f8d3041127261686940e3d6a5"

DESCRIPTION="Utility for running external programs"
HOMEPAGE="https://github.com/ruricolist/cmd"
SRC_URI="https://github.com/ruricolist/cmd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/serapeum
"
BDEPEND=""
