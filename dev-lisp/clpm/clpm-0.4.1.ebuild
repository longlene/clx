# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp Package Manager"
HOMEPAGE="https://gitlab.common-lisp.net/clpm/clpm"
SRC_URI="https://gitlab.common-lisp.net/clpm/clpm/-/archive/v${PV}/clpm-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""
