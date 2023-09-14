# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1

DESCRIPTION="Easy building and installing of Erlang/OTP instances"
HOMEPAGE="https://github.com/kerl/kerl"
SRC_URI="https://github.com/kerl/kerl/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bash-completion zsh-completion"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin kerl
	use bash-completion && newbashcomp bash_completion/kerl kerl
	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		doins zsh_completion
	fi
	dodoc README.md
}

