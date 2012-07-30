# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils 

DESCRIPTION="System of hooks for portage"
HOMEPAGE="http://www.salug.it/~sydro/progetti/"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64 ~hppa ~ppc ~sparc"
SLOT="0"


pkg_setup () {

	ewarn "You must create a directory in /etc/portage/hooks with ebuild phase name."
	ewarn "Es. EBUILD_PHASE=preinst  The directory should be /etc/portage/hooks/preinst.d"
	ewarn "In each directory there are any numbered scripts:  10example 20example"
	
}

pkg_postinst() {

	if [ -d ${ROOT}/etc/portage ] ; then

        cat <<__EOF__ > ${ROOT}/etc/portage/portage-hooks

LOCAL_DIR="/etc/portage/hooks"

if [[ -d \$LOCAL_DIR/\$EBUILD_PHASE.d ]] ; then
	einfo "Running \$EBUILD_PHASE phase hooks"

	for script in \$LOCAL_DIR/\$EBUILD_PHASE.d/*
	do
		\$script
	done
	einfo "..done"

fi

__EOF__

        echo "source /etc/portage/portage-hooks" >> ${ROOT}/etc/portage/bashrc

	
	if [ -d ${ROOT}/etc/portage/hooks ] ; then 
		ewarn "ATTENTION: /etc/portage/hooks exists!"	
	else
		mkdir ${ROOT}/etc/portage/hooks
	fi

        fi

}

pkg_postrm() {

	if [ -e /etc/portage/portage-hooks ] ; then

		sed  -i '/portage-hooks/d' ${ROOT}/etc/portage/bashrc
		rm -rf ${ROOT}/etc/portage/portage-hooks
	
		if [[ "$(ls ${ROOT}/etc/portage/hooks)" != "" ]] ; then
			mv ${ROOT}/etc/portage/hooks ${ROOT}/etc/portage/hooks.back
			ewarn "ATTENTION: /etc/portage/hooks was moved in /etc/portage/hooks.back"
		else
			rm -rf  ${ROOT}/etc/portage/hooks
		fi
	fi
	
}
