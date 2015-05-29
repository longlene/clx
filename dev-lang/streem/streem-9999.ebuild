# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="prototype of stream based programming language"
HOMEPAGE="https://github.com/matz/streem"
SRC_URI=""

EGIT_REPO_URI="https://github.com/matz/streem.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="examples"

DEPEND="
sys-devel/bison
sys-devel/flex
dev-libs/boehm-gc
"
RDEPEND="${DEPEND}"

src_install() {
	dobin bin/streem
	dodoc README.md

	if use examples ; then
		insinto /usr/share/${P}
		doins examples
	fi
}
