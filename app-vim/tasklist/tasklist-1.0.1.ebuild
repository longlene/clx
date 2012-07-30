# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit vim-plugin

DESCRIPTION="This script is based on the eclipse Task List. It will search the file for FIXME, TODO, and XXX (or a custom list) and put them in a handy list for you to browse which at the same time will update the location in the document so you can see exactly where the tag is located."
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2607"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=10388 -> ${P}.vim"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
S=${WORKDIR}

DEPEND=""
RDEPEND=""

src_unpack() {
	mkdir "${S}/plugin" || die
	cp "${DISTDIR}/${P}.vim" "${S}/plugin/${PN}.vim" || die
}
