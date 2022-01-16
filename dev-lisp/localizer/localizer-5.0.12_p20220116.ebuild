# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a8120a195dcd489250ee30c27d13c3dcbc73b1a3"

DESCRIPTION="Localize system for common lisp"
HOMEPAGE="https://github.com/hyotang666/localizer"
SRC_URI="https://github.com/hyotang666/localizer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
