# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

EGIT_COMMIT="23f5ab74e770bbab3ab0a2dfcfcad15960ace804"

DESCRIPTION="Generic scanner for Erlang"
HOMEPAGE="https://github.com/bel-framework/bel-scan"
SRC_URI="https://github.com/bel-framework/bel-scan/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/bel-scan-${EGIT_COMMIT}

