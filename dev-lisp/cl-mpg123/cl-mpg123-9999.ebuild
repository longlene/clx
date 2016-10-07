# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Bindings to libmpg123, allowing fast MPG1/2/3 decoding"
HOMEPAGE="http://shirakumo.github.io/cl-mpg123/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shirakumo/cl-mpg123.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/documentation-utils
	media-sound/mpg123
"

src_prepare() {
	eapply_user
	use example || rm -rf example.lisp ${PN}-example.asd
}
