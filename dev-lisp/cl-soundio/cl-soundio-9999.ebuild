# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp bindings for libsoundio to allow direct sound input and output cross-platform"
HOMEPAGE="https://github.com/Shirakumo/cl-soundio"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shirakumo/cl-soundio.git"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/documentation-utils
	media-libs/libsoundio
"

src_prepare() {
	eapply_user
	use example || rm ${PN}-examples.asd example.lisp
}
