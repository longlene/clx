# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4effd6547ff4df11c515ece9018f48ef53887465"

DESCRIPTION="Common Lisp tool to generate documentation pages using an HTML template"
HOMEPAGE="https://shinmera.github.io/staple"
SRC_URI="https://github.com/Shinmera/staple/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/babel
	dev-lisp/clip
	dev-lisp/cl-ppcre
	dev-lisp/definitions
	dev-lisp/pathname-utils
	dev-lisp/language-codes
	dev-lisp/documentation-utils
"
