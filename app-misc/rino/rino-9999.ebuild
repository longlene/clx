# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

EGIT_REPO_URI="https://github.com/soveran/rino.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	echo "rino: rino.o" >> makefile
}

src_install() {
	dobin rino
	dodoc README

}
