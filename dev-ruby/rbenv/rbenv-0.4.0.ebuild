# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit multilib bash-completion-r1 vcs-snapshot

DESCRIPTION="Groom your app's Ruby environment"
HOMEPAGE="https://github.com/sstephenson/rbenv"
SRC_URI="https://github.com/sstephenson/rbenv/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
#KEYWORDS=""
IUSE="bash-completion zsh-completion"

DEPEND=""
RDEPEND="${DEPEND}
zsh-completion? ( app-shells/zsh-completion )"


src_install() {
	local dest=/usr/$(get_libdir)/${PN}/libexec

	dodir ${dest}

	exeinto ${dest}
	doexe libexec/*

	dosym ${dest}/${PN} /usr/bin/${PN}

	dodoc README.md

	use bash-completion && newbashcomp completions/rbenv.bash ${PN}

	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		doins completions/rbenv.zsh
	fi

	local fenv=99rbenv
	cat > ${fenv} <<-EOF
	RBENV_ROOT=${dest}
	EOF
	doenvd ${fenv}
}

pkg_postinst() {
	echo
	elog "Please add:"
	elog "eval \"\$(rbenv init -)\""
	elog "to your profile"
	echo
}
