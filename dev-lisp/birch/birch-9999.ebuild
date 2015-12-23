# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 common-lisp-3

DESCRIPTION="A Simple Common Lisp IRC client library"
HOMEPAGE="https://github.com/jorams/birch"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jorams/birch.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/split-sequence
	dev-lisp/usocket
	dev-lisp/flexi-streams
	dev-lisp/alexanria
"

src_prepare() {
	use test || rm -rf test birch.test.asd
}
