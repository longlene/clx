# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TOML11_COMMIT="4b740127230472779c4a4d71e1a75aaa3a367a2d"

DESCRIPTION="A package manager and build system for C++"
HOMEPAGE="https://poac.dev/"
SRC_URI="
	https://github.com/poac-dev/poac/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ToruNiina/toml11/archive/${TOML11_COMMIT}.tar.gz -> toml11-${TOML11_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	mkdir -p build-out/DEPS && ln -sv "${WORKDIR}"/toml11-${TOML11_COMMIT} build-out/DEPS/toml11
}

src_install() {
	dobin build-out/poac
	einstalldocs
}
