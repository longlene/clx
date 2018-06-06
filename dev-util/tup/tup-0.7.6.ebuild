# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="49fc3ff5b946a6ab15802d36a9dc906bc770a572"

DESCRIPTION="A fast, file-based build system"
HOMEPAGE="http://gittup.org/tup/"
SRC_URI="https://github.com/gittup/tup/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="vim-syntax"

DEPEND="
	dev-vcs/git
	sys-fs/fuse
"
RDEPEND="${DEPEND}"

src_compile() {
	./build.sh || die
}

src_install() {
	dobin build/tup
	doman tup.1
	if use vim-syntax ; then
		insinto /usr/share/vim/vimfiles/syntax
		doins contrib/syntax/tup.vim
		insinto /usr/share/vim/vimfiles/ftdetect
		doins "${FILESDIR}"/tup.vim
	fi
}

