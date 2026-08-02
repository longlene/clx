# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang/OTP agent for home automation and server control via Telegram and Ollama"
HOMEPAGE="https://github.com/wmealing/inky"
SRC_URI="https://github.com/wmealing/inky/archive/c11230ec0649705294a3f7ff61fc33316da48eb4.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/inky-c11230ec0649705294a3f7ff61fc33316da48eb4"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/hackney
	dev-erlang/pe4kin
"
