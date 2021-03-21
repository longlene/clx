# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="16ea312edb19c825cd875886eb830ed9a0f8efb9"

DESCRIPTION="Lack Middleware Authentication CAS"
HOMEPAGE="https://github.com/flotsfacetieux/cl-lmac"
SRC_URI="https://github.com/flotsfacetieux/cl-lmac/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-cas
	dev-lisp/split-sequence
	dev-lisp/quri
"
BDEPEND=""
