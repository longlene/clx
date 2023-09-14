# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f1b26ba5e51b37413ff36029616c5704d88d8086"

DESCRIPTION="CSS Like Simple Selectors"
HOMEPAGE="https://github.com/Shinmera/CLSS"
SRC_URI="https://github.com/Shinmera/CLSS/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/array-utils
	dev-lisp/plump
"
