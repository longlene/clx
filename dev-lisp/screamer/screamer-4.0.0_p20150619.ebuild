# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="700359e930e66c8e833e15c83deea6c893f35d1c"

DESCRIPTION="An extension of Common Lisp that adds support for nondeterministic programming"
HOMEPAGE="https://github.com/nikodemus/screamer"
SRC_URI="https://github.com/nikodemus/screamer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	use test || rm ${PN}-tests.asd tests.lisp
}
