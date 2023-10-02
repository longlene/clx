# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="ac0e815ec7a1278f95c90160040709c6bf595fe7"

DESCRIPTION="Uring based Network Programming"
HOMEPAGE="https://github.com/deepgrace/unp"
SRC_URI="https://github.com/deepgrace/unp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/*
	einstalldocs
}
