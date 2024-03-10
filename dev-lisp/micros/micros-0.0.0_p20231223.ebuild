# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="23f52d5349382d3d50c855b75a665f3158286390"

DESCRIPTION="Micro slime/swank with forked SLIME"
HOMEPAGE="https://github.com/lem-project/micros"
SRC_URI="https://github.com/lem-project/micros/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
