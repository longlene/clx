# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="a56cd2d684c62653bf13ac2fd8236f4a533f3ca0"

DESCRIPTION="Uring based Asynchronous Rpc"
HOMEPAGE="https://github.com/deepgrace/urpc"
SRC_URI="https://github.com/deepgrace/urpc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-cpp/unp
"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/*
	einstalldocs
}
