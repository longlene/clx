# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="L-system or Lindenmayer system on lists"
HOMEPAGE="https://github.com/ebrasca/l-system"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ebrasca/l-system.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use example || rm -rf examples ${PN}-example.asd 
}
