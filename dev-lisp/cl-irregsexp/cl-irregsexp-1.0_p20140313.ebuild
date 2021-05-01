# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cc23512d3fe2880c5df47fa96d47b352c3d5b73a"

DESCRIPTION="More powerful and prettier way of text matching in Common Lisp."
HOMEPAGE="http://common-lisp.net/projects/cl-irregsexp/"
SRC_URI="https://github.com/vii/cl-irregsexp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/alexandria
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	use test || rm ${PN}-test.asd t
}
