# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib bash-completion-r1 vcs-snapshot

DESCRIPTION="Groom your app's Ruby environment"
HOMEPAGE="https://github.com/rbenv/rbenv"
SRC_URI="https://github.com/rbenv/rbenv/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="bash-completion zsh-completion"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	cp "${FILESDIR}"/rbenv-init libexec
}


src_install() {
	insinto /usr/$(get_libdir)/rbenv
	doins -r bin libexec rbenv.d/exec
	dosym /usr/$(get_libdir)/rbenv/libexec/bin/rbenv /usr/bin/rbenv
	dodoc README.md

	use bash-completion && newbashcomp completions/rbenv.bash ${PN}

	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		newins completions/rbenv.zsh _rbenv
	fi
}

pkg_postinst() {
	echo
	elog "Please add:"
	elog "eval \"\$(rbenv init -)\""
	elog "to your profile"
	echo
}
