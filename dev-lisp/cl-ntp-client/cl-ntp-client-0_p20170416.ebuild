# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="289b5b7d02f08d89316d3631d82ac00131f2c6e3"

DESCRIPTION="A Nework Time Protocol client written in Common Lisp"
HOMEPAGE="https://github.com/varjagg/cl-ntp-client"
SRC_URI="https://github.com/varjagg/cl-ntp-client/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/usocket
"
