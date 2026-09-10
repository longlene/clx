# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A local coding agent for Apple Silicon: Qwen3 in-process via MLX, VS Code extens"
HOMEPAGE="https://github.com/kitty-on-keyboard/Piper-Agent"
SRC_URI="https://github.com/kitty-on-keyboard/Piper-Agent/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/Piper-Agent-${PV}"

LICENSE="TODO"
SLOT="0"
KEYWORDS="~amd64"
