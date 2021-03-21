# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9c6d960c0bb7e6f62945966665d428ab19f8d829"

DESCRIPTION="An authentication library"
HOMEPAGE="https://github.com/flotsfacetieux/cl-cas"
SRC_URI="https://github.com/flotsfacetieux/cl-cas/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/dexador
	dev-lisp/xmls
	dev-lisp/quri
"
BDEPEND=""
