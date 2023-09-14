# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d7e74a821a991641a579cd8f2380f0dd69d6ae6e"

DESCRIPTION="Implementation of fact bases for Common Lisp"
HOMEPAGE="https://github.com/inaimathi/fact-base"
SRC_URI="https://github.com/inaimathi/fact-base/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/local-time
	dev-lisp/optima
	dev-lisp/cl-fad
"
