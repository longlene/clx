# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git

DESCRIPTION="An experimental alternative to the git-submodule command."
HOMEPAGE="https://github.com/apenwarr/git-subtree"
EGIT_REPO_URI="https://github.com/apenwarr/git-subtree.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

RDEPEND=">=dev-vcs/git-1.5.4"
DEPEND="${RDEPEND}
	app-text/xmlto
	app-text/asciidoc"

src_compile() {
	emake doc || die "emake failed"
}

src_install() {
	emake prefix="/usr" DESTDIR="${D}" install || die "emake install failed"
	dodoc COPYING
	dodoc git-subtree.txt
}
