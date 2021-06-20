# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A Common Lisp feature to get number of CPUs on Linux/Mac/Windows"
HOMEPAGE="https://github.com/muyinliu/cl-cpus"
SRC_URI="https://github.com/muyinliu/cl-cpus/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
