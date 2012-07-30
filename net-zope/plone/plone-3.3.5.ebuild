# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-zope/plone/plone-3.1.7.ebuild,v 1.4 2009/03/18 15:02:29 ranger Exp $

inherit versionator eutils

MY_P="Plone-${PV}-UnifiedInstaller"
DESCRIPTION="A Zope Content Management System, based on Zope CMF."
HOMEPAGE="http://plone.org/"
SRC_URI="https://launchpad.net/${PN}/$(get_version_component_range 1-2)/${PV}/+download/${MY_P}.tgz"

LICENSE="GPL-2"
SLOT="3.0"
KEYWORDS="~amd64"
IUSE="cluster"

DEPEND=""
RDEPEND=">=dev-libs/openssl-0.9.8o
	>=sys-libs/zlib-1.2.3-r1
	>=media-libs/jpeg-8a
	>=sys-libs/readline-6.1
	>=dev-libs/libxml2-2.7.7"

S="${WORKDIR}/${MY_P}"

INSTALL_DIR="/usr/local/plone"
INSTANCE_NAME="zinstance"

pkg_setup() {
	# Need this here because install.sh will try to make a plone user and we
	# don't want it to succeed.
	enewgroup plone
	enewuser plone -1 -1 -1 plone
}

src_install() {
	mkdir -p "${D}${INSTALL_DIR}"

	# The ./install.sh script sees if there is a 'plone' user and since we
	# created one in pkg_setup ./install.sh moves on.
	# If use --with-python ./install.sh will use an installed Python with
	# virtualenv.  Unfortunately virtualenv does not make a nice relocatable
	# Python.  If any package is installed in the new location you should run
	# virtualenv again which isn't nice.
	if use cluster; then
		./install.sh --target="${D}${INSTALL_DIR}" zeo
		INSTANCE_NAME="zeocluster"
	else
		./install.sh --target="${D}${INSTALL_DIR}" standalone
		INSTANCE_NAME="zinstance"
	fi

	# Need to add line ending to last line of file so that it prints correctly
	# in pkg_postinst.
	echo "" >> "${D}${INSTALL_DIR}/${INSTANCE_NAME}/adminPassword.txt"

	# Build init file
	cat > "${PN}" <<-EOF
		#!/sbin/runscript

		opts="start stop restart"

		start() {
			${INSTALL_DIR}/${INSTANCE_NAME}/bin/plonectl start > /dev/null
		}

		stop() {
			${INSTALL_DIR}/${INSTANCE_NAME}/bin/plonectl stop > /dev/null
		}

		restart() {
			${INSTALL_DIR}/${INSTANCE_NAME}/bin/plonectl restart > /dev/null
		}

		status() {
			${INSTALL_DIR}/${INSTANCE_NAME}/bin/plonectl status > /dev/null
		}
	EOF
	doinitd "${PN}" || die "doinitd failed"

	# Will try and fix most of the hard-coded paths in pkg_postinst, but here
	# are a couple that need to get done in order to fix the buildout.
	sed -i "s:${D}:/:g" "${D}${INSTALL_DIR}/${INSTANCE_NAME}/buildout.cfg"

}

pkg_postinst() {
	# This should correct all of the hard-coded paths.
	cd ${INSTALL_DIR}/${INSTANCE_NAME}
	# Need to find the right libraries when running buildout.
	../Python-2.4/bin/python bootstrap.py
	rm -f .installed.cfg
	bin/buildout

	elog "You should carefully manage your zope and plone instance manually(!)"
	elog "with appropriate tools."
	elog ""
	elog "If you have a simple installation (just zope and plone) you can safely"
	elog "execute:'zprod-manager add' and then mark ${P} to be added to your instance."
	elog ""
	elog "What follows is the contents of 'adminPassword.txt' in the new Plone"
	elog "instance ${INSTALL_DIR}/${INSTANCE_NAME}."
	elog ""
	while read line
	do
		elog $line
	done < "${INSTALL_DIR}/${INSTANCE_NAME}/adminPassword.txt"
}

