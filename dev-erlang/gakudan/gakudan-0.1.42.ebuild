# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Multi-agent collaboration primitives for the BEAM"
HOMEPAGE="https://github.com/Taure/gakudan"
SRC_URI="https://github.com/Taure/gakudan/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/kura
	dev-erlang/telemetry
"

src_compile() {
	erebar3 compile
}

src_prepare() {
	# Remove project_plugins and provider_hooks — plugins try to fetch from
	# the network, and their hooks fail when plugins aren't present
	python3 -c "
import re
txt = open('rebar.config').read()
txt = re.sub(r'\{project_plugins,\s*\[.*?\]\}\.\n?', '', txt, flags=re.DOTALL)
txt = re.sub(r'\{provider_hooks,\s*\[.*?\]\}\.\n?', '', txt, flags=re.DOTALL)
open('rebar.config', 'w').write(txt)
" || die
	rebar3_src_prepare
}
