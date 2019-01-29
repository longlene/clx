# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8b1da94eca4613fd8a20bdf63f0e609e379b0ba5"

DESCRIPTION="A minimal testing framework"
HOMEPAGE="https://github.com/lmj/1am"
SRC_URI="https://github.com/lmj/1am/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
