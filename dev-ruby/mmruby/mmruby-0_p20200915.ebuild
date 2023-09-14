# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="9c776f47ebe2fc3b1740465e0924d3c79977e93b"

DESCRIPTION="mini mruby compiler integrated with mruby/c VM"
HOMEPAGE="https://github.com/hasumikin/mmruby"
SRC_URI="
	https://github.com/hasumikin/mmruby/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/mrubyc/mrubyc/archive/release2.1.tar.gz -> mrubyc-2.1.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/ruby
"

src_prepare() {
	default
	rmdir src/mrubyc
	mv "${WORKDIR}"/mrubyc-2.1 src/mrubyc
}

src_compile() {
	emake host_all
}

src_install() {
	dobin cli/{mmrbc,mmruby}
	dodoc README.md
}
