# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/vmihailenco/msgpack"

DESCRIPTION="MessagePack encoding for Golang"
HOMEPAGE="https://github.com/vmihailenco/msgpack"
SRC_URI="https://github.com/vmihailenco/msgpack/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
