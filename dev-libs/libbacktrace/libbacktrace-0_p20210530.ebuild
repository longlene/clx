# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="d0f5e95a87a4d3e0a1ed6c069b5dae7cbab3ed2a"

DESCRIPTION="A C library that may be linked into a C/C++ program to produce symbolic backtraces"
HOMEPAGE="https://github.com/ianlancetaylor/libbacktrace"
SRC_URI="https://github.com/ianlancetaylor/libbacktrace/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
