# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )

inherit cmake python-any-r1

DESCRIPTION="Procedural language compiler with inspectable pipeline stages"
HOMEPAGE="https://github.com/saqutlang/saqut"
SRC_URI="https://github.com/saqutlang/saqut/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="as-is MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

# python3 runs scripts/embed_internal.py to embed src/internal/*.sqt
# into a generated header at build time.
BDEPEND="${PYTHON_DEPS}"

# Upstream defines no install() rule; the product is the saqut binary.
src_install() {
	dobin "${BUILD_DIR}"/saqut
}
