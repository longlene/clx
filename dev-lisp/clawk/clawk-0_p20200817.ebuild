# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3a91634df686417114044a98c063cbe76bfac7b6"

DESCRIPTION="Common Lisp AWK"
HOMEPAGE="https://github.com/sharplispers/clawk"
SRC_URI="https://github.com/sharplispers/clawk/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all clawk.system clawk.translations emp.data license.txt
}
