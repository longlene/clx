# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="TODO"
HOMEPAGE="https://github.com/barrel-platform/barrel_inference"
SRC_URI="https://github.com/barrel-platform/barrel_inference/archive/refs/tags/erllama-v${PV}.tar.gz
	-> ${P}.tar.gz"
S="${WORKDIR}/barrel_inference-erllama-v${PV}"

LICENSE="TODO"
SLOT="0"
KEYWORDS="~amd64"
