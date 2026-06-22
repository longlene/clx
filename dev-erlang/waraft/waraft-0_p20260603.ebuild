# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="e585ea44932f050a99517de671fd946cbb0d6a65"

DESCRIPTION="An Erlang implementation of RAFT from WhatsApp"
HOMEPAGE="https://github.com/WhatsApp/waraft"
SRC_URI="https://github.com/WhatsApp/waraft/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

REBAR_APP_SRC="src/wa_raft.app.src"
