# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Screamer is an extension of Common Lisp that adds support for nondeterministic programming"
HOMEPAGE="https://github.com/nikodemus/screamer"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nikodemus/screamer.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use test || rm ${PN}-tests.asd tests.lisp
}
