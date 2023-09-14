# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="47d4da65e9ea20953b74aeeab7e89a831b66bc94"

DESCRIPTION="A package of queue data structures"
HOMEPAGE="https://github.com/oconnore/queues"
SRC_URI="https://github.com/oconnore/queues/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
