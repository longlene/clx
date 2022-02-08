# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A lightweight online game framework"
HOMEPAGE="https://github.com/cloudwu/skynet"
SRC_URI="
	https://github.com/cloudwu/skynet/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/jemalloc/jemalloc/archive/refs/tags/5.2.1.tar.gz -> jemalloc-5.2.1.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir 3rd/jemalloc && ln -sv "${WORKDIR}"/jemalloc-5.2.1 3rd/jemalloc
}

src_compile() {
	emake linux
}

src_install() {
	dobin skynet
	dodoc README.md
	insinto /usr/lib/skynet
	doins -r cservice service lualib luaclib
}
