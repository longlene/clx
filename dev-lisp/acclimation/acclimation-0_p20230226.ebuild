# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4fc59692f2a12d1038fd3978bb6e66f554672049"

DESCRIPTION="Tools for internationalization of Common Lisp programs"
HOMEPAGE="https://github.com/robert-strandh/Acclimation"
SRC_URI="https://github.com/robert-strandh/Acclimation/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
