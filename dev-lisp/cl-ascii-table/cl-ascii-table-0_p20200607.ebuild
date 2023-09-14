# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3c316cd75dd70aa359bf8b6bfda98e2e8dcd4eae"

DESCRIPTION="Common Lisp API to present tabular data in ASCII-art tables"
HOMEPAGE="https://github.com/telephil/cl-ascii-table"
SRC_URI="https://github.com/telephil/cl-ascii-table/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
