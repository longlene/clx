# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/eclass/kde-meta.eclass,v 1.82 2007/03/18 21:39:30 carlo Exp $
#
# Author Anant Narayanan <anant@gentoo.org>
#
# This is the plan9-libs eclass which supports broken-up Plan9 libraries.

DESCRIPTION="The ${PN} library in Plan9 from user space"
HOMEPAGE="http://swtch.com/plan9port/"
#SRC_URI="http://wwww.kix.in/plan9/plan9port-repack-${PV}.tar.bz2"
SRC_URI="http://plan9port.googlecode.com/files/plan9port-${PV}.tgz"
LICENSE="PLAN9"
SLOT="0"

DEPEND="dev-plan9/mk ${DEPEND}"

# Add a blocking dep on the package we're derived from
#	DEPEND="${DEPEND} !=$(get-parent-package ${CATEGORY}/${PN})-${SLOT}*"
#	RDEPEND="${RDEPEND} !=$(get-parent-package ${CATEGORY}/${PN})-${SLOT}*"

S="${WORKDIR}/plan9port"

function set_path() {
PLAN9=`pwd` export PLAN9
PATH=/bin:/usr/bin:$PLAN9/bin:$PATH export PATH

if [[ -e ${S}/src/${PN} ]]; then
	cd ${S}/src/${PN}
else
	cd ${S}/src/cmd/${PN}
fi
}

function plan9-libs_src_compile() {
set_path
mk all || die "Build Failed!"
}

function plan9-libs_src_install() {
set_path
mk install || die "Install Failed!"

if [[ -n "$PLIBNAME" ]]; then
	dolib.a ${S}/lib/${PLIBNAME}.a
else
	dolib.a ${S}/lib/${PN}.a
fi

if [[ -n "$PHEADERS" ]]; then
	insinto /usr/include/plan9
	for i in $PHEADERS; do
		doins ${S}/include/${i}.h
	done
fi
}

EXPORT_FUNCTIONS src_compile src_install

