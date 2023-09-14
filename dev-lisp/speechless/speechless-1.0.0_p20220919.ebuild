# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="97f6ef29c49d126e49a71477b138bebcacdcaa49"

DESCRIPTION="A dialogue system language implementation"
HOMEPAGE="https://github.com/Shirakumo/speechless"
SRC_URI="https://github.com/Shirakumo/speechless/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-markless
	dev-lisp/documentation-utils
"
BDEPEND=""
