# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Inspired by
#	http://forums.gentoo.org/viewtopic-t-430913.html
#	the file bjfiler-common.spec (download SRC_URI)
#	The Ebuild Howto (gentoo.org)

# Changelog since last bugzilla upload
#
# changed license from "???" to "UNKNOWN"
# fixed dependency syntax
# preserve library symlinks
#

inherit eutils rpm flag-o-matic multilib

DESCRIPTION="Canon Bubble Jet Printer Driver for Linux (Pixus/Pixma-Series)."
HOMEPAGE="ftp://download.canon.jp/pub/driver/bj/linux/"
RESTRICT="nomirror confcache"

SRC_URI="${HOMEPAGE}${PN}-common-${PV}-3.src.rpm"
LICENSE="UNKNOWN" # GPL-2 source and proprietary binaries

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="amd64
	servicetools
	nocupsdetection
	ip1000
	ip1500
	ip3100
	ip4100
	ip8600"

DEPEND="app-text/ghostscript-gpl
	>=net-print/cups-1.1.14
	!amd64? ( sys-libs/glibc
		>=dev-libs/popt-1.6
		>=media-libs/tiff-3.4
		>=media-libs/libpng-1.0.9 )
	amd64? ( >=app-emulation/emul-linux-x86-bjdeps-0.1
		app-emulation/emul-linux-x86-compat
		app-emulation/emul-linux-x86-baselibs )
	servicetools? ( !amd64? ( >=gnome-base/libglade-0.6
			>=dev-libs/libxml2-1.8
			=x11-libs/gtk+-1.2* )
		amd64? ( >=app-emulation/emul-linux-x86-bjdeps-0.1
			app-emulation/emul-linux-x86-gtklibs ) )"

# Dependencies
#	information by canon	associated x86 packages		AMD64
# always:
#	>=libcups-1.1*		>=net-print/cups-1.1.14		emul-linux-x86-baselibs
#	>=libpopt-1.4*		>=dev-libs/popt-1.4		>=emul-linux-x86-bjdeps-0.1 (available at bugs.gentoo.org)
#	>=libm-6.0		sys-libs/glibc			emul-linux-x86-compat
#	>=libdl-2.0		sys-libs/glibc			emul-linux-x86-compat
#	>=libtiff-3.4		>=media-libs/tiff-3.4		emul-linux-x86-baselibs
#	>=libpng-1.0.9		>=media-libs/libpng-1.0.9	emul-linux-x86-baselibs
#	>=cups-1.1.14		>=net-print/cups-1.1.14		emul-linux-x86-baselibs
#	>=ghostscript-5.50	virtual/ghostscript		virtual/ghostscript
# if use servicetools:
#	>=gtk+-1.2*		>=x11-libs/gtk+-1.2		emul-linux-x86-gtklibs
#	>=libpopt-1.6*		>=dev-libs/popt-1.6		>=emul-linux-x86-bjdeps-0.1 (available at bugs.gentoo.org)
#	>=libglade-0.6*		>=gnome-base/libglade-0.6	>=emul-linux-x86-bjdeps-0.2
#	>=libxml-1.8*		>=dev-libs/libxml-1.8		>=emul-linux-x86-bjdeps-0.2

# Arrays of supported Printers, there IDs and compatible models
_pruse=("ip1000" "ip1500" "ip3100" "ip4100" "ip8600")
_prname=("pixmaip1000" "pixmaip1500" "pixusip3100" "pixusip4100" "pixusip8600")
_prid=("230" "214" "218" "221" "238")
_prcomp=("i250/320/350 ip1000" "i450/455/470d/475 ip1500/2000 mp360/370/390" "i560/850 ip3000/3100 mp700/730" "i860/865 ip4000/4100/5000 mp750/760/770/780790" "ip8600")
_max=$((${#_pruse[@]}-1))

###
#   Standard Ebuild-functions
###

pkg_setup() {
	if [ -z "$LINGUAS" ]; then    # -z tests to see if the argument is empty
		ewarn "You didn't specify 'LINGUAS' in your make.conf. Assuming"
		ewarn "english localisation, i.e. 'LINGUAS=\"en\"'."
		LINGUAS="en"
	fi
	if (use amd64 && use servicetools); then
		eerror "You can't build this package with 'servicetools' on amd64,"
		eerror "because you would need to compile '>=gnome-base/libglade-0.6'"
		eerror "and '>=dev-libs/libxml-1.8' with 'export ABI=x86' first."
		eerror "That's exactly what 'emul-linux-x86-bjdeps-0.1' does with"
		eerror "'dev-libs/popt-1.6'. I encourage you to adapt this ebuild"
		eerror "to build 32bit versions of 'libxml' and 'libglade' too!"
		die "servicetools not yet available on amd64"
	fi

	use amd64 && export ABI=x86
	use amd64 && append-flags -L/emul/linux/x86/lib -L/emul/linux/x86/usr/lib -L/usr/lib32 

	_prefix="/usr/local"
	_bindir="/usr/local/bin"
	_libdir="/usr/$(get_libdir)" # either lib or lib32
	_cupsdir1="/usr/lib/cups"
	_cupsdir2="/usr/libexec/cups"
	_ppddir="/usr/share/cups/model"

	einfo ""
	einfo " USE-flags       (description / probably compatible printers)"
	einfo ""
	einfo " amd64           (basic support for this architecture - currently without servicetools)"
	einfo " servicetools    (additional monitoring and maintenance software)"
	einfo " nocupsdetection (this is only useful to create binary packages)"
	_autochoose="true"
	for i in `seq 0 ${_max}`; do
		einfo " ${_pruse[$i]}\t${_prcomp[$i]}"
		if (use ${_pruse[$i]}); then
			_autochoose="false"
		fi
	done
	einfo ""
	if (${_autochoose}); then
		ewarn "You didn't specify any driver model (set it's USE-flag)."
		einfo ""
		einfo "As example:\tbasic MP780 support without maintenance tools"
		einfo "\t\t -> USE=\"ip4100\""
		einfo ""
		einfo "Press Ctrl+C to abort"
		echo
		ebeep

		n=15
		while [[ $n -gt 0 ]]; do
			echo -en "  Waiting $n seconds...\r"
			sleep 1
			(( n-- ))
		done

	fi
}

src_unpack() {
	rpm_unpack ${DISTDIR}/bjfilter-common-${PV}-3.src.rpm || die
	# now trick 'unpack' to work:
	OLD_DISTDIR=${DISTDIR}
	DISTDIR=${WORKDIR}
	unpack bjfilter-common-${PV}-3.tar.gz || die
	DISTDIR=${OLD_DISTDIR}

	mv bjfilter-common-${PV} ${P} || die # Correcting directory-structure

	if use "ip4100" || ${_autochoose}; then
		epatch ${FILESDIR}/bjfilter-2.50-pixusip4100-ppd.patch || die
	fi
}

src_compile() {
	cd libs || die
	./autogen.sh --prefix=${_prefix} || die "Error: libs/autoconf.sh failed"
	make || die "Couldn't make libs"

	cd ../pstocanonbj || die
	./autogen.sh --prefix=/usr --enable-progpath=${_bindir} || die "Error: pstocanonbj/autoconf.sh failed"
	make || die "Couldn't make pstocanonbj"

	if use servicetools; then
		cd ../bjcups || die
		./autogen.sh --prefix=${_prefix} --enable-progpath=${_bindir} || die "Error: bjcups/autoconf.sh failed"
		make || die "Couldn't make bjcups"

		cd ../bjcupsmon || die # It's neccessary to cd into bjcupsmon for the next script to work
		./autogen.sh --prefix=${_prefix} || die "Error: bjcupsmon/autoconf.sh failed"
		make || die "Couldn't make bjcupsmon"
	fi

	cd ..

	for i in `seq 0 ${_max}`; do
		if use ${_pruse[$i]} || ${_autochoose}; then
			_pr=${_prname[$i]} _prid=${_prid[$i]}
			src_compile_pr;
		fi
	done
}

src_install() {
	mkdir -p ${D}${_bindir} || die
	mkdir -p ${D}${_ppddir} || die
	mkdir -p ${D}${_libdir}/bjlib || die

	cd libs || die
	make DESTDIR=${D} install || die "Couldn't make install libs"

	cd ../pstocanonbj || die
	make DESTDIR=${D} install || die "Couldn't make install pstocanonbj"

	if use servicetools; then
		cd ../bjcups || die
		make DESTDIR=${D} install || die "Couldn't make install bjcups"

		cd ../bjcupsmon || die
		make DESTDIR=${D} install || die "Couldn't make install bjcupsmon"
	fi

	cd ..

	for i in `seq 0 ${_max}`; do
		if use ${_pruse[$i]} || ${_autochoose}; then
			_pr=${_prname[$i]} _prid=${_prid[$i]}
			src_install_pr;
		fi
	done

	# fix directory structure
	if use nocupsdetection; then
		mkdir -p ${D}${_cupsdir2}/filter || die
		mkdir -p ${D}${_cupsdir2}/backend || die
		dosym ${_cupsdir1}/backend/canon_parallel ${_cupsdir2}/backend/canon_parallel
		doysm ${_cupsdir1}/backend/canon_usb ${_cupsdir2}/backend/canon_usb
		dosym ${_cupsdir1}/filter/pstocanonbj ${_cupsdir2}/filter/pstocanonbj
	elif has_version ">=net-print/cups-1.2.0"; then
		mkdir -p ${D}${_cupsdir2} || die
		mv ${D}${_cupsdir1}/* ${D}${_cupsdir2} || die
	fi
}

pkg_postinst() {
	einfo ""
	einfo "For installing a printer:"
	einfo " * Restart CUPS: /etc/init.d/cupsd restart"
	einfo " * Go to http://127.0.0.1:631/"
	einfo "   -> Printers -> Add Printer"
	einfo ""
	einfo "If you experience any problems, please visit:"
	einfo " http://forums.gentoo.org/viewtopic-p-3217721.html"
	einfo ""
}

###
#	Custom Helper Functions
###

src_compile_pr()
{
	mkdir ${_pr}
	cp -a ${_prid} ${_pr} || die
	cp -a bjfilter ${_pr} || die
	cp -a printui ${_pr} || die
	cp -a stsmon ${_pr} || die

	cd ${_pr}/bjfilter || die
	./autogen.sh --prefix=${_prefix} --program-suffix=${_pr} --enable-libpath=${_libdir}/bjlib --enable-binpath=${_bindir} || die
	make || die "Couldn't make ${_pr}/bjfilter"

	if use servicetools; then
		cd ../printui || die
		./autogen.sh --prefix=${_prefix} --program-suffix=${_pr} || die
		make || die "Couldn't make ${_pr}/printui"

		cd ../stsmon || die
		./autogen.sh --prefix=${_prefix} --program-suffix=${_pr} --enable-progpath=${_bindir} || die
		make || die "Couldn't make ${_pr}/stsmon"
	fi

	cd ../..
}

src_install_pr()
{
	cd ${_pr}/bjfilter || die
	make DESTDIR=${D} install || die "Couldn't make install ${_pr}/bjfilter"

	if use servicetools; then
		cd ../printui || die
		make DESTDIR=${D} install || die "Couldn't make install ${_pr}/printui"

		cd ../stsmon || die
		make DESTDIR=${D} install || die "Couldn't make install ${_pr}/stsmon"
	fi

	cd ../..
	cp -a ${_prid}/libs_bin/* ${D}${_libdir} || die
	cp -a ${_prid}/database/* ${D}${_libdir}/bjlib || die
	cp -a ppd/canon${_pr}.ppd ${D}${_ppddir} || die
}
