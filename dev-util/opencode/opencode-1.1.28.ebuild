# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The open source AI coding agent"
HOMEPAGE="
	https://github.com/anomalyco/opencode
	https://opencode.ai/
"
SRC_URI="
	amd64? (
		https://github.com/anomalyco/opencode/releases/download/v${PV}/opencode-linux-x64.tar.gz -> opencode-${PV}-linux-x64.tar.gz
	)
	arm64? (
		https://github.com/anomalyco/opencode/releases/download/v${PV}/opencode-linux-arm64.tar.gz -> opencode-${PV}-linux-arm64.tar.gz
	)
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	dobin ${PN}
}
