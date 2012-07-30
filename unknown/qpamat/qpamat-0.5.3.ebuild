# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# NOTE: The comments in this file are for instruction and documentation.
# They're not meant to appear with your final, production ebuild.  Please
# remember to remove them before submitting or committing your ebuild.  That
# doesn't mean you can't add your own comments though.

# The 'Header' on the third line should just be left alone.  When your ebuild
# will be committed to cvs, the details on that line will be automatically
# generated to contain the correct data.

# The EAPI variable tells the ebuild format in use.
# Defaults to 0 if not specified. The current PMS draft contains details on
# a proposed EAPI=0 definition but is not finalized yet.
# Eclasses will test for this variable if they need to use EAPI > 0 features.
#EAPI=0

# inherit lists eclasses to inherit functions from. Almost all ebuilds should
# inherit eutils, as a large amount of important functionality has been
# moved there. For example, the epatch call mentioned below wont work
# without the following line:
inherit eutils

# Short one-line description of this package.
DESCRIPTION="Password management tool written in qt."

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="http://qpamat.berlios.de/"

# Point to any required sources; these will be automatically downloaded by
# Portage.
SRC_URI="http://download.berlios.de/qpamat/${P}.tar.bz2 http://download.berlios.de/qpamat/qpamat_gcc43.diff http://download.berlios.de/qpamat/qpamat-gcc44"

# License of the package.  This must match the name of file(s) in
# /usr/portage/licenses/.  For complex license combination see the developer
# docs on gentoo.org for details.
LICENSE="GPL-2"

# The SLOT variable is used to tell Portage if it's OK to keep multiple
# versions of the same package installed at the same time.  For example,
# if we have a libfoo-1.2.2 and libfoo-1.3.2 (which is not compatible
# with 1.2.2), it would be optimal to instruct Portage to not remove
# libfoo-1.2.2 if we decide to upgrade to libfoo-1.3.2.  To do this,
# we specify SLOT="1.2" in libfoo-1.2.2 and SLOT="1.3" in libfoo-1.3.2.
# emerge clean understands SLOTs, and will keep the most recent version
# of each SLOT and remove everything else.
# Note that normal applications should use SLOT="0" if possible, since
# there should only be exactly one version installed at a time.
# DO NOT USE SLOT=""! This tells Portage to disable SLOTs for this package.
SLOT="0"

# Using KEYWORDS, we can record masking information *inside* an ebuild
# instead of relying on an external package.mask file.  Right now, you should
# set the KEYWORDS variable for every ebuild so that it contains the names of
# all the architectures with which the ebuild works.  All of the official
# architectures can be found in the keywords.desc file which is in
# /usr/portage/profiles/.  Usually you should just set this to "~x86".  The ~
# in front of the architecture indicates that the package is new and should be
# considered unstable until testing proves its stability.  So, if you've
# confirmed that your ebuild works on x86 and ppc, you'd specify:
# KEYWORDS="~x86 ~ppc"
# Once packages go stable, the ~ prefix is removed.
# For binary packages, use -* and then list the archs the bin package
# exists for.  If the package was for an x86 binary package, then
# KEYWORDS would be set like this: KEYWORDS="-* x86"
# DO NOT USE KEYWORDS="*".  This is deprecated and only for backward
# compatibility reasons.
KEYWORDS="~x86 ~amd64"

# Comprehensive list of any and all USE flags leveraged in the ebuild,
# with the exception of any ARCH specific flags, i.e. "ppc", "sparc",
# "x86" and "alpha".  This is a required variable.  If the ebuild doesn't
# use any USE flags, set to "".
IUSE=""

# A space delimited list of portage features to restrict. man 5 ebuild
# for details.  Usually not needed.
#RESTRICT="strip"

# Build-time dependencies, such as
#    ssl? ( >=dev-libs/openssl-0.9.6b )
#    >=dev-lang/perl-5.6.1-r1
# It is advisable to use the >= syntax show above, to reflect what you
# had installed on your system when you tested the package.  Then
# other users hopefully won't be caught without the right version of
# a dependency.
DEPEND="dev-libs/openssl 
	x11-libs/qt-core 
	x11-libs/qt-test 
	x11-libs/qt-gui 
	x11-libs/qt-dbus 
	x11-libs/qt-qt3support 
	x11-libs/qt-sql"

# Run-time dependencies. Must be defined to whatever this depends on to run.
# The below is valid if the same run-time depends are required to compile.
RDEPEND="${DEPEND}"

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
#S="${WORKDIR}/${P}"

src_unpack() {
	unpack  "${P}".tar.bz2
	cd "${S}"
	EPATCH_SOURCE="${DISTDIR}"
	EPATCH_OPTS="-p1"
	epatch "${DISTDIR}"/qpamat_gcc43.diff
	epatch "${DISTDIR}"/qpamat-gcc44
	}

src_compile() {
	qmake qpamat.pro
	lrelease qpamat.pro
	sed -i 's/\/usr\/local/\/usr/g' Makefile
	emake || die "emake failed"
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die "emake install failed"
	mkdir "${D}"/usr/bin && cp ./bin/qpamat "${D}"/usr/bin  
}
