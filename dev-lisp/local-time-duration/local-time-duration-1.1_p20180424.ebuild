# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fa20a4a03a1ee076eada649796e2f2345c930c21"

DESCRIPTION="Duration processing library built on top of local-time"
HOMEPAGE="https://github.com/enaeher/local-time-duration"
SRC_URI="https://github.com/enaeher/local-time-duration/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/local-time
	dev-lisp/alexandria
	dev-lisp/esrap
"
BDEPEND=""
