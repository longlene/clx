# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic 

DESCRIPTION="Apache Axis2/C is a Web services engine implemented in the C
programming language"
HOMEPAGE="http://ws.apache.org/axis2/c/index.html"
SRC_URI="http://mirror.ox.ac.uk/sites/rsync.apache.org/ws/axis2/c/1_6_0/${PN}-src-${PVR}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~ppc64"
IUSE=""

DEPEND=">=www-servers/apache-2.2.6"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}-src-${PVR}"

src_compile(){
	#Setting paths to Apache and APR header files explicitly
	# TODO: Are there any portage/eclass utils that will allow
	# the ebuild to read these values from the package database?
	local APACHE_INCLUDES="/usr/include/apache2"
	local APR_INCLUDES="/usr/include/apr-1"
	
	#Set the following so that the tests can run.
	#NOTE: Axis2c is currently being installed under /opt.
	#Question: Do we want to override the behaviour in the make file and
	# integrate the files into the file system under /usr/lib, /usr/bin, etc?
	local AXIS2C_HOME="${D}/opt/axis2c"

	#If we do not append CFLAGS with -w the make fails
	append-flags "-w"
	
	econf --prefix=${AXIS2C_HOME} --with-apache2=$APACHE_INCLUDES --with-apr=$APR_INCLUDES --enable-multi-thread=no || die "econf failed"
	emake || die "emake failed"

	#Test everything is working fine:
	#make check
}

src_install(){
	#emake install --prefix="${D}" ||die "emake install failed";
	emake install || die "emaks install failed"
}

