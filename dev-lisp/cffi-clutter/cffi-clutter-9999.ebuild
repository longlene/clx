# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Thin Common Lisp bindings for Clutter toolkit"
HOMEPAGE="https://github.com/stacksmith/cffi-clutter"
SRC_URI=""

EGIT_REPO_URI="https://github.com/stacksmith/cffi-clutter.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/alexandria
	media-libs/clutter
"

src_prepare() {
	eapply_user
	use example || rm -rf clutter-examples.asd examples
}
