# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1a4f345d7911b403d07a5f300e6006ce3efa4047"

DESCRIPTION="Basic functions and macros, interfaces, pure and stateful datastructures"
HOMEPAGE="https://github.com/fare/fare-utils"
SRC_URI="https://github.com/fare/fare-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	use test || rm -rf test
}
