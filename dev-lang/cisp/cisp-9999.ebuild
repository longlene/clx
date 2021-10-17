# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

DESCRIPTION="Minimal Lisp Interpreter"
HOMEPAGE="https://github.com/mattn/cisp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mattn/cisp.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin cisp
	dodoc README.md
}
