# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="A minimal C runtime for Linux"
HOMEPAGE="https://github.com/lpsantil/rt0"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lpsantil/rt0.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e '/SYSINC/ s#$(ARCH)-linux-gnu/##' \
		-e '/ifeq/ s/x86_64/amd64/' \
		-e '/echo/ s#\\n##g' \
		-i Makefile
}

src_install() {
	insinto /usr
	doins -r include
	dolib.a lib/librt0.a
	dodoc AUTHORS README.md
}
