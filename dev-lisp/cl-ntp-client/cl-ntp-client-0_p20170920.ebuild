# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="20f323bba9ac4966d3dab8d13377d7cd22074ceb"

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
