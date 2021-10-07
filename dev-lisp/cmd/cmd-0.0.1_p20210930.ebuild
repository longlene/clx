# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d39af02625cd8434e7dcf70d38b9b5aacce05a22"

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
