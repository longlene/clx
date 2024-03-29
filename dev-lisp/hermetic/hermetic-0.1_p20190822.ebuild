# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="234e78c52a057e273dea0bffc94e3c04f4bec2c8"

DESCRIPTION="Security for Clack-based Common Lisp web applications"
HOMEPAGE="https://github.com/eudoxia0/hermetic"
SRC_URI="https://github.com/eudoxia0/hermetic/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/cl-pass
	dev-lisp/crane
	example? ( dev-lisp/ningle dev-lisp/lack dev-lisp/cl-markup )
"

src_prepare() {
	eapply_user
	use example || rm -r ${PN}-demo.asd demo ${PN}-crane-demo.asd contrib/crane/demo
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
