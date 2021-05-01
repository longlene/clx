# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c6c0d253e1bf30aa4d563728f55919284bccf594"

DESCRIPTION="A Common Lisp feature to get number of CPUs on Linux/Mac/Windows"
HOMEPAGE="https://github.com/muyinliu/cl-cpus"
SRC_URI="https://github.com/muyinliu/cl-cpus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
