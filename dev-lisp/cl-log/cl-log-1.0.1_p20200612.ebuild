# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8f4b766d51e02245c310526cf1e4534ce634f837"

DESCRIPTION="Common Lisp general purpose logging utility"
HOMEPAGE="https://github.com/nicklevine/cl-log"
SRC_URI="https://github.com/nicklevine/cl-log/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
