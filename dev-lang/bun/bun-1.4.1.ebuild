# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Incredibly fast JavaScript runtime, bundler, test runner, and package manager –"
HOMEPAGE="https://github.com/oven-sh/bun"
SRC_URI="https://github.com/oven-sh/bun/archive/refs/tags/bun-v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/bun-bun-v${PV}"

LICENSE="TODO"
SLOT="0"
KEYWORDS="~amd64"
