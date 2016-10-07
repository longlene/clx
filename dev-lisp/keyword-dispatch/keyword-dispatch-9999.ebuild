# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Generic dispatch on the presence of keyword arguments"
HOMEPAGE="https://github.com/mobius-eng/keyword-dispatch"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mobius-eng/keyword-dispatch.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
"

src_prepare() {
	eapply_user
	use test || rm -rf t ${PN}-test.asd
}
