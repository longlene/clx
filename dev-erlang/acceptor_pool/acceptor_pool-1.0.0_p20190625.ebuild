# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

EGIT_COMMIT="3cbc455c103b8885401f161fd765a9b2f18203f2"

DESCRIPTION="gen_tcp acceptor pool"
HOMEPAGE="https://github.com/fishcakez/acceptor_pool"
SRC_URI="https://github.com/fishcakez/acceptor_pool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
