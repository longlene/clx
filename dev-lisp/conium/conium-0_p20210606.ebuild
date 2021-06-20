# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="089adfd8759ec7973bb6f67b98d7a246e67aeb05"

DESCRIPTION="a portability library for debugger"
HOMEPAGE="https://github.com/sharplispers/conium"
SRC_URI="https://github.com/sharplispers/conium/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
"
