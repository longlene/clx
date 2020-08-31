# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5b06e91358dc528126994c168ee943ad138e3fa7"

DESCRIPTION="The actor model implemented with closures"
HOMEPAGE="https://github.com/j3pic/simple-actors/"
SRC_URI="https://github.com/j3pic/simple-actors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
BDEPEND=""
