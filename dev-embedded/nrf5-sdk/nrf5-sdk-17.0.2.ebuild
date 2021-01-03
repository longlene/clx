# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

DESCRIPTION="Software development kit for the nRF52 Series and nRF51 Series SoCs"
HOMEPAGE="https://github.com/nobodywasishere/nrf5-sdk"
SRC_URI="https://github.com/nobodywasishere/nRF5-SDK/archive/v17.0.2-d674dde.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /opt/nrf5-sdk
	doins -r components config examples external external_tools integration modules
	dodoc documentation/licenses.txt
}
