# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="7eeda6c129577723e968735ee5495e00dd2e47da"

DESCRIPTION="gen_tcp acceptor pool"
HOMEPAGE="https://github.com/fishcakez/acceptor_pool"
SRC_URI="https://github.com/fishcakez/acceptor_pool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
