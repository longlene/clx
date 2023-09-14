# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="578e6b38753f4be548301e8455f1a0f0c116a524"

DESCRIPTION="Basic reader for Excel files"
HOMEPAGE="https://gitlab.common-lisp.net/cungil/xlsx"
SRC_URI="https://gitlab.common-lisp.net/cungil/xlsx/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/zip
	dev-lisp/flexi-streams
	dev-lisp/xmls
"


