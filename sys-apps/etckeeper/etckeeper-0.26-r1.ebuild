# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils git

DESCRIPTION="Etckeeper is a collection of tools to let /etc be stored in a git, mercurial, or bzr repository."
HOMEPAGE="http://kitenet.net/~joey/code/etckeeper/"

EGIT_REPO_URI="git://git.kitenet.net/etckeeper"

LICENSE="GPL-2"
IUSE="mercurial bzr bash-completion"
KEYWORDS="~x86 ~amd64 ~hppa ~ppc ~sparc"
SLOT="0"

DEPEND=">=app-portage/gentoolkit-0.2.3-r1
	sys-apps/metastore
	mercurial? ( dev-util/mercurial )
	bzr? ( dev-util/bzr )
	bash-completion? ( app-shells/bash-completion ) "

src_unpack() {
	git_src_unpack
	epatch "${FILESDIR}"/etckeeper-gentoo.patch
}


src_compile() {
        if use bzr; then
		emake || die "make failed : problem in support python for bzr" 
	fi
}


src_install() {

	emake DESTDIR=${D} install || die "make install failed"
	
	if use bash-completion; then
		install -m 0644 -D bash_completion ${ROOT}/etc/bash_completion.d/etckeeper
	fi

	if use bzr; then
		./etckeeper-bzr/__init__.py install --root=${D} || die "Error: bzr support installation"
	fi

        #dodoc INSTALL TODO README || die "docs failed"
}

pkg_postinst() {
	
	if [ -d ${ROOT}/etc/portage ] ; then

	cat <<__EOF__ > ${ROOT}/etc/portage/etckeeper
case "\$EBUILD_PHASE" in

	"preinst" | "prerm" )
       		if [ -x /usr/sbin/etckeeper ]; then
               		etckeeper pre-install
       		fi
	;;

	"postinst" | "postrm" )
       		if [ -x /usr/sbin/etckeeper ]; then
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
		sed  -i '/etckeeper/d' ${ROOT}/etc/portage/bashrc

	fi
}
