# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="274050a4f66592c16d84747d23c608af29bd7b63"

DESCRIPTION="cpp singleton that works across dll/exe boundaries"
HOMEPAGE="https://github.com/xhawk18/singleton-cpp"
SRC_URI="https://github.com/xhawk18/singleton-cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/singleton-cpp
	dodoc Readme.md
}
