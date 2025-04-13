# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

EGIT_COMMIT="e8e68e7ff79d053e4353450bbd6209c4cee1d576"

DESCRIPTION="DOM (Document Object Model) API for Erlang"
HOMEPAGE="https://github.com/bel-framework/bel-dom"
SRC_URI="https://github.com/bel-framework/bel-dom/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/bel_html
	dev-erlang/bel_css
"
BDEPEND=""

S="${WORKDIR}"/bel-dom-${EGIT_COMMIT}
