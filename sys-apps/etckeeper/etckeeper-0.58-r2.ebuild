# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="git://git.kitenet.net/etckeeper"

inherit eutils git-2 bash-completion-r1

DESCRIPTION="Etckeeper is a collection of tools to let /etc be stored in a git, mercurial, or bzr repository."
HOMEPAGE="http://kitenet.net/~joey/code/etckeeper/"

EGIT_COMMIT="${PV}"

LICENSE="GPL-2"
IUSE="bash-completion bzr mercurial portage"
KEYWORDS="~x86 ~amd64 ~arm ~hppa ~ppc ~sparc"
SLOT="0"

DEPEND="
	portage? ( sys-apps/sed )
"
RDEPEND="
	!portage? ( app-portage/gentoolkit )
	portage? ( sys-apps/portage )
		mercurial? ( dev-vcs/mercurial )
		bzr? ( dev-util/bzr )"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-gentoo-0.58.patch
	if use portage; then
		sed -i 's/equery/portage/' etckeeper.conf
	fi
}


src_compile() {
	if use bzr; then
		emake || die "make failed : problem in support python for bzr"
	fi
}


src_install() {
	emake DESTDIR=${D} install || die "make install failed"

	use bash-completion && newbashcomp bash_completion etckeeper
	if use bzr; then
		./etckeeper-bzr/__init__.py install --root=${D} || die "Error: bzr support installation"
	fi
	dodoc INSTALL TODO README || die "dodoc failed"
}

pkg_postinst() {

	if [ -d ${ROOT}/etc/portage ] ; then

	cat <<__EOF__ > ${ROOT}/etc/portage/etckeeper
case "\$EBUILD_PHASE" in

	"preinst" | "prerm" )
			if [ -x /usr/bin/etckeeper ]; then
					etckeeper pre-install
			fi
	;;

	"postinst" | "postrm" )
			if [ -x /usr/bin/etckeeper ]; then
					etckeeper post-install
			fi
		;;
	esac
__EOF__

	chmod 755 ${ROOT}/etc/portage/etckeeper
	echo "source /etc/portage/etckeeper" >> ${ROOT}/etc/portage/bashrc

	fi
}

pkg_postrm() {
	if [ -e /etc/portage/etckeeper ] ; then
		rm -rf ${ROOT}/etc/portage/etckeeper
		sed -i '/etckeeper/d' ${ROOT}/etc/portage/bashrc
	fi
}
