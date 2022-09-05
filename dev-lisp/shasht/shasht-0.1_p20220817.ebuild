# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="f38e866990c6b5381a854d63f7ea0227c87c2f6d"

DESCRIPTION="Common Lisp JSON reading and writing for the Kzinti"
HOMEPAGE="https://github.com/yitzchak/shasht"
SRC_URI="https://github.com/yitzchak/shasht/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-do
	dev-lisp/closer-mop
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem #:shasht\/test/,$d' \
		-i ${PN}.asd
	rm -rf tests
}
