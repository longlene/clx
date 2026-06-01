# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="AI coding agent optimized for small LLMs"
HOMEPAGE="https://github.com/Doorman11991/smallcode"
SRC_URI="https://github.com/Doorman11991/smallcode/releases/download/v${PV}/smallcode-Linux-X64.tar.gz -> ${P}-linux-x64.tar.gz"

S="${WORKDIR}/smallcode"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"

QA_PREBUILT="opt/${PN}/node_modules/better-sqlite3/build/Release/better_sqlite3.node"

RDEPEND=">=net-libs/nodejs-18"

src_install() {
	insinto "/opt/${PN}"
	doins -r bin/ extensions/ marrow/ node_modules/ src/ \
		package.json smallcode.toml mcp.json

	fperms +x "/opt/${PN}/bin/smallcode.js"
	fperms +x "/opt/${PN}/bin/init.js"
	fperms +x "/opt/${PN}/bin/rag-index.js"

	dodir /opt/bin
	dosym "../${PN}/bin/smallcode.js" /opt/bin/smallcode
	dosym "../${PN}/bin/smallcode.js" /opt/bin/smolv2
	dosym "../${PN}/bin/init.js"      /opt/bin/smallcode-init
	dosym "../${PN}/bin/rag-index.js" /opt/bin/smallcode-rag-index

	dodoc README.md .env.example
}
