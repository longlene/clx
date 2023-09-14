# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9a7cb7f48b04197c0495df3b6d2e8395ad13f790"

DESCRIPTION="Implementation pools for resource management"
HOMEPAGE="https://github.com/archimag/garbage-pools"
SRC_URI="https://github.com/archimag/garbage-pools/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rm ${PN}-test.asd test.lisp
}
