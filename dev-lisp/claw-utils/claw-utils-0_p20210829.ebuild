# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="28501a69c6d1115aecfe1b0f7471159f84520b76"

DESCRIPTION="Utilities for easier autowrapping"
HOMEPAGE="https://github.com/borodust/claw-utils"
SRC_URI="https://github.com/borodust/claw-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
"
BDEPEND=""
