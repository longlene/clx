# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="917e87c294d1de094684ea25e12a8e2a6aaad55d"

DESCRIPTION="A new user interface protocol and toolkit implementation"
HOMEPAGE="https://github.com/Shirakumo/alloy"
SRC_URI="https://github.com/Shirakumo/alloy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/array-utils
	dev-lisp/closer-mop
"
BDEPEND=""
