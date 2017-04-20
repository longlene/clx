# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A Common Lisp Interface to Java"
HOMEPAGE="https://common-lisp.net/project/cl-plus-j/"
SRC_URI="http://common-lisp.net/project/cl-plus-j/releases/cl+j-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/tordeaux-threads
"

src_prepare() {
	eapply_user
	use example || rm -r demos
}
