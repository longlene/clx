# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1

DESCRIPTION="Erlang build tool that makes it easy to compile and test Erlang applications and releases"
HOMEPAGE="http://www.rebar3.org"
SRC_URI="https://github.com/erlang/rebar3/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
IUSE="bash-completion zsh-completion"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 ~s390 ~sh sparc x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc64-solaris"

RDEPEND="dev-lang/erlang"
DEPEND="${RDEPEND}"

RESTRICT=network-sandbox

S="${WORKDIR}"/rebar3-${PV}

src_compile() {
	./bootstrap
}

src_install() {
	dobin rebar3
	dodoc rebar.config.sample THANKS
	use bash-completion && dobashcomp priv/shell-completion/bash/${PN}

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins priv/shell-completion/zsh/_*
	fi
}
