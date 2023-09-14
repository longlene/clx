# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a31945b38be6eaa82eea5293e5e82adcdf54bb4a"

DESCRIPTION="Common Lisp with Arc Macros and Procedures"
HOMEPAGE="https://github.com/malisper/Clamp"
SRC_URI="https://github.com/malisper/Clamp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/cl-syntax
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd tests ${PN}-experimental.asd experimental
}
