# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a simple tool to convert vimwiki files to emacs org-mode"
HOMEPAGE="https://github.com/fasheng/vimwiki2org"
SRC_URI="https://github.com/fasheng/vimwiki2org/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/perl
"

src_install() {
	newbin vimwiki2org.pl vimwiki2org
	dodoc README.markdown
}
