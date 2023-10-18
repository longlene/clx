# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A fast JSON serializing & deserializing library"
HOMEPAGE="https://github.com/bytedance/sonic-cpp"
SRC_URI="https://github.com/bytedance/sonic-cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/sonic
	einstalldocs
}
