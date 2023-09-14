# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6d03d15d0cd154e2feb35a434363e393721b49ba"

DESCRIPTION="Check if a list fulfills a specified template"
HOMEPAGE="https://github.com/K1D77A/validate-list/"
SRC_URI="https://github.com/K1D77A/validate-list/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/arithmetic-operators-as-words
	dev-lisp/lisp-unit
	dev-lisp/alexandria
"
BDEPEND=""
