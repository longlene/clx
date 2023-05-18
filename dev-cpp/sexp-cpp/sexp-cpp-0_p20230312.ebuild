# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="812da1e3533e5afe609370c02cd4918fb77efc89"

DESCRIPTION="A S-Expression Parser for C++"
HOMEPAGE="https://gitlab.com/lispparser/sexp-cpp"
SRC_URI="
	https://gitlab.com/lispparser/sexp-cpp/-/archive/${EGIT_COMMIT}/sexp-cpp-${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/grumbel/tinycmmc/archive/43c75c5344979c5ad4c65233aa407e3ec6d92c03.tar.gz -> tinycmmc-43c75c5344979c5ad4c65233aa407e3ec6d92c03.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir external/tinycmmc && ln -sv "${WORKDIR}"/tinycmmc-43c75c5344979c5ad4c65233aa407e3ec6d92c03 external/tinycmmc
	cmake_src_prepare
}
