# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="3f08f3ca60c063dd07fd6044aa6f38149129f74b"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/WhatsApp/waraft/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

REBAR_APP_SRC="src/wa_raft.app.src"
