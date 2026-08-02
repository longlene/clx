# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The open source coding agent"
HOMEPAGE="https://github.com/sst/opencode"
SRC_URI="https://github.com/sst/opencode/releases/download/v${PV}/opencode-linux-x64.tar.gz -> ${P}-linux-x64.tar.gz"

S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"

QA_PREBUILT="usr/bin/opencode"

src_install() {
	newbin opencode opencode
}
