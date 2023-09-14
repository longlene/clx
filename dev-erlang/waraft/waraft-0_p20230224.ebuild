# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="85b60d927faaf7038cd6b79a0edfa5b0bab315a4"

DESCRIPTION="An Erlang implementation of RAFT from WhatsApp"
HOMEPAGE="https://github.com/WhatsApp/waraft"
SRC_URI="https://github.com/WhatsApp/waraft/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

REBAR_APP_SRC="src/wa_raft.app.src"
