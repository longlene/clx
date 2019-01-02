# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1aea67b62980d735783b6d7f5f7840780e1238dc"

DESCRIPTION="a portability library for debugger"
HOMEPAGE="https://github.com/bluelisp/conium"
SRC_URI="https://github.com/bluelisp/conium/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
"
