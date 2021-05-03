# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="25bfad236e841e80a3bba6c888e607aec9b75dc7"

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
