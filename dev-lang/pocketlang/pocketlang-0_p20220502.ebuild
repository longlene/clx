# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="1d77ec7adf7184a3a672307a950431ecb0aad0e0"

DESCRIPTION="A small and fast programming language"
HOMEPAGE="https://github.com/ThakeeNathees/pocketlang"
SRC_URI="https://github.com/ThakeeNathees/pocketlang/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_install() {
	dobin build/Debug/bin/pocket
	einstalldocs
}
