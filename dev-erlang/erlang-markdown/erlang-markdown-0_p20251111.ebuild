# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="d2f91b537033455ba0f1ae695f74450c7cb3827e"
REBAR_APP_SRC="apps/markdown/src/markdown.app.src"

inherit rebar3

DESCRIPTION="CommonMark and GFM compliant Markdown parser with ASTs and extensions"
HOMEPAGE="https://github.com/WhatsApp/erlang-markdown"
SRC_URI="https://github.com/WhatsApp/erlang-markdown/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/erlang-markdown-${MY_COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-erlang/redbug"

src_install() {
	pushd "_build/${REBAR_PROFILE}" >/dev/null || die
	rebar3_install_lib lib/markdown
	popd >/dev/null || die
	einstalldocs
}
