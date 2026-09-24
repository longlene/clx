# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An open-source AI agent that lives in your terminal"
HOMEPAGE="https://github.com/QwenLM/qwen-code"
MY_BASE_URI="https://github.com/QwenLM/qwen-code/releases/download/v${PV}"
SRC_URI="
	amd64? ( ${MY_BASE_URI}/qwen-code-linux-x64.tar.gz -> ${P}-linux-amd64.tar.gz )
	arm64? ( ${MY_BASE_URI}/qwen-code-linux-arm64.tar.gz -> ${P}-linux-arm64.tar.gz )
"
S="${WORKDIR}/qwen-code"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"
RESTRICT="strip"

QA_PREBUILT="
	opt/qwen-code/node/bin/node
	opt/qwen-code/lib/node_modules/@qwen-code/audio-capture/prebuilds/*
"

src_install() {
	dodir /opt/qwen-code
	cp -a . "${ED}/opt/qwen-code/" || die

	# The bundled bin/qwen uses dirname $0 to locate node, which breaks when
	# called via a symlink from /usr/bin. Use a wrapper with absolute paths.
	printf '#!/usr/bin/env sh\nexec /opt/qwen-code/node/bin/node --expose-gc /opt/qwen-code/lib/cli.js "$@"\n' \
		> "${T}/qwen" || die
	chmod +x "${T}/qwen" || die
	dobin "${T}/qwen"

	insinto /etc/${PN}
	doins "${FILESDIR}"/settings.json
}
