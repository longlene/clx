# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="flexible terminal-based text editor"
HOMEPAGE="https://github.com/adsr/mle"
SRC_URI="
	https://github.com/adsr/mle/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/lua/lua/archive/5d708c3f9cae12820e415d4f89c9eacbe2ab964b.tar.gz -> lua-5d708c3f9cae12820e415d4f89c9eacbe2ab964b.tar.gz
	https://github.com/adsr/pcre/archive/3a69c005e512791dc021562bdb89a16e77b1ba91.tar.gz -> pcre-3a69c005e512791dc021562bdb89a16e77b1ba91.tar.gz
	https://github.com/troydhanson/uthash/archive/8b214aefcb81df86a7e5e0d4fa20e59a6c18bc02.tar.gz -> uthash-8b214aefcb81df86a7e5e0d4fa20e59a6c18bc02.tar.gz

"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir vendor/lua && ln -sv "${WORKDIR}"/lua-5d708c3f9cae12820e415d4f89c9eacbe2ab964b vendor/lua
	rmdir vendor/pcre && ln -sv "${WORKDIR}"/pcre-3a69c005e512791dc021562bdb89a16e77b1ba91 vendor/pcre
	rmdir vendor/uthash && ln -sv "${WORKDIR}"/uthash-8b214aefcb81df86a7e5e0d4fa20e59a6c18bc02 vendor/uthash
}

src_compile() {
	mle_vendor=1 emake
}

src_install() {
	prefix="${D}"/usr emake install
	doman mle.1
	einstalldocs
}
