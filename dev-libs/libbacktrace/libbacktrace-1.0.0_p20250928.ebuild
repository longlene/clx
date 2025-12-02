# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="2f67a3abfd1947ddec71fc11965a9cf9191d45ad"

DESCRIPTION="A C library that may be linked into a C/C++ program to produce symbolic backtraces"
HOMEPAGE="https://github.com/ianlancetaylor/libbacktrace"
SRC_URI="https://github.com/ianlancetaylor/libbacktrace/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
