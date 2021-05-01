# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3670c75691801867cc58680d135ef4ba930a6319"

DESCRIPTION="Parsing, AST and \"walking\" for Common Lisp code"
HOMEPAGE="https://sourceforge.net/projects/clast/"
SRC_URI="https://sourceforge.net/code-snapshots/git/c/cl/clast/code.git/clast-code-${EGIT_COMMIT}.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/clast-code-${EGIT_COMMIT}
