# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="390b5390dce060026400f8a598778929c0316480"

DESCRIPTION="Type safe user input"
HOMEPAGE="https://github.com/hyotang666/prompt-for"
SRC_URI="https://github.com/hyotang666/prompt-for/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
