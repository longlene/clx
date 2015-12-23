# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 common-lisp-3

DESCRIPTION="Partially apply functions and expressions in the spirit of SRFI 26"
HOMEPAGE="https://github.com/cromachina/cl-cut/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cromachina/cl-cut.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	use test || rm -rf cl-cut.test.asd test
}
