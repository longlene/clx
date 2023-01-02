# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_P=swift-${PV}

DESCRIPTION="Binary builds of the Swift programming language"
HOMEPAGE="https://swift.org"
SRC_URI="https://swift.org/builds/${MY_P}-release/centos7/${MY_P}-RELEASE/${MY_P}-RELEASE-centos7.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libxml2
	sys-apps/util-linux
	sys-libs/ncurses-compat
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/swift-${PV}-RELEASE-centos7

src_install() {
	insinto /opt/${MY_P}
	doins -r usr/{include,lib,local,share}
	insopts -m0755
	doins -r usr/bin
	dosym ../../opt/${MY_P}/bin/swift-frontend /usr/bin/swift
	dosym ../../opt/${MY_P}/bin/swift-frontend /usr/bin/swiftc
	dosym ../../opt/${MY_P}/bin/sourcekit-lsp /usr/bin/sourcekit-lsp
}
