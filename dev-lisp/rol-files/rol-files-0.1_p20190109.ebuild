# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="30915c8a7f8e8326effd91f5d34da6b3a0960096"

DESCRIPTION="RailsOnLisp filesystem toolbox"
HOMEPAGE="https://github.com/RailsOnLisp/rol-files"
SRC_URI="https://github.com/RailsOnLisp/rol-files/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-fad
	dev-lisp/cl-ppcre
"
BDEPEND=""
