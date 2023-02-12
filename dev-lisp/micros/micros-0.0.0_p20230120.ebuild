# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="03871d3d482b3f6600cc01cb2f80ed7917b0b4f7"

DESCRIPTION="Micro slime/swank with forked SLIME"
HOMEPAGE="https://github.com/lem-project/micros"
SRC_URI="https://github.com/lem-project/micros/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
