# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="266afaf4ac091fe0e8803bac2ae72d238144e735"

DESCRIPTION="unit-testing framework for common lisp"
HOMEPAGE="https://github.com/hanshuebner/unit-test"
SRC_URI="https://github.com/hanshuebner/unit-test/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
