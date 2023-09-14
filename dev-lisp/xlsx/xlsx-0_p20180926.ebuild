# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ecf4f113556a1afae5dc0f7e77d8aa484aeccbaf"

DESCRIPTION="Basic reader for Excel files"
HOMEPAGE="https://github.com/a-nano/xlsx"
SRC_URI="https://github.com/a-nano/xlsx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/zip
	dev-lisp/xmls
	dev-lisp/babel
"
BDEPEND=""
