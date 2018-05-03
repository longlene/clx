# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6fc7cd1a88e8f30d64904ed9ab0347f786fc6e0c"

DESCRIPTION="Common Lisp web development widget library for Twitter's Bootstrap"
HOMEPAGE="https://github.com/rajasegar/cl-bootstrap"
SRC_URI="https://github.com/rajasegar/cl-bootstrap/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-who
	dev-lisp/parenscript
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd ${PN}-test.lisp
}
