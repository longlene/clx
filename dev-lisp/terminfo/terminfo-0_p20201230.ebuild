# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b8b2e3ed786bfcf9f1aa4a264cee2e93135080f5"

DESCRIPTION="A terminfo database front end in Common Lisp"
HOMEPAGE="https://github.com/npatrick04/terminfo"
SRC_URI="https://github.com/npatrick04/terminfo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
