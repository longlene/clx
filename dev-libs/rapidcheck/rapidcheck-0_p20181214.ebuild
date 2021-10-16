# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="3eb9b4ff69f4ff2d9932e8f852c2b2a61d7c20d3"

DESCRIPTION="QuickCheck clone for C++ with the goal of being simple to use with as little boilerplate as possible"
HOMEPAGE="https://github.com/emil-e/rapidcheck"
SRC_URI="https://github.com/emil-e/rapidcheck/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
