# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="beec0f727bd804339bdaef5450b46d78664b701b"

DESCRIPTION="Parenscript is a small lispy language that can be compiled to JavaScript."
HOMEPAGE="http://common-lisp.net/project/parenscript/"
SRC_URI="https://github.com/vsedach/Parenscript/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="
	dev-lisp/anaphora
	dev-lisp/cl-ppcre
	dev-lisp/named-readtables
	test? ( dev-lisp/eos dev-lisp/cl-js )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.test.asd t
}
	
