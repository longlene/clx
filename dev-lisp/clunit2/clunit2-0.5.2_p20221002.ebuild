# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="200839e8e47e9212ded2d36520d84b9be681037c"

DESCRIPTION="Unit Testing Framework"
HOMEPAGE="https://notabug.org/cage/clunit2"
SRC_URI="https://notabug.org/cage/clunit2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
