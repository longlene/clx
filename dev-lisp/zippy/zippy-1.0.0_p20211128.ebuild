# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2e0769dcb1e92501ef94fbb2ecd0fbf7f8079bf1"

DESCRIPTION="A ZIP archive format library based on 3bz"
HOMEPAGE="https://github.com/Shinmera/zippy"
SRC_URI="https://github.com/Shinmera/zippy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/file-attributes
	dev-lisp/pathname-utils
	dev-lisp/alexandria
	dev-lisp/nibbles
	dev-lisp/babel
	dev-lisp/3bz
	dev-lisp/salza2
"
BDEPEND=""
