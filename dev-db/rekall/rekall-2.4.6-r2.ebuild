# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit kde python eutils

DESCRIPTION="Rekall - QT/KDE based Database application development & management frontend for MySQL, PostgreSQL, Xbase and others."
HOMEPAGE="http://www.rekallrevealed.org/"
SRC_URI="http://www.rekallrevealed.org/packages/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

IUSE="mysql postgres odbc mdbtools xbase sqlite3 kjs rekallrt rekallqt rekallqtonly norekallkjs"

DEPEND="dev-util/scons
	sys-apps/sed
	virtual/python
	mysql? ( >=dev-db/mysql-3.23.58-r1 )
	postgres? ( >=dev-db/libpq-7.4.17 )
	xbase? (>=dev-db/xbase-2.0.0 )
	sqlite3? (>=dev-db/sqlite-3.3.12 )
	odbc? (>=dev-db/unixODBC-2.2.11-r1 )"
	#mdbtools? (>=app-office/mdbtools-0.6_pre1-r1)

RDEPEND="virtual/python
	mysql? ( >=dev-db/mysql-3.23.58-r1 )
	postgres? ( >=dev-db/libpq-7.4.17 )
	sqlite3? (>=dev-db/sqlite-3.3.12 )
	odbc? (>=dev-db/unixODBC-2.2.11-r1 )"

need-kde 3

src_unpack() {
        python_version
	unpack ${A}
	cd ${S}

	#patches
	for i in ${FILESDIR}/24*patch ; do
		epatch "$i" || die
	done

	if (( ${PYVER_MINOR} > 4 )) ; then
                epatch ${FILESDIR}/intlongpython25.patch || die
        fi

	#copy over the Makefile
	cp -pPR scons/Makefile Makefile
	#Makefile to use our generic settings template
 	sed -i -e "s:--spec=settings.kde:--spec=settings:" \
	-e "s:--spec=settings.qt3:--spec=settings:" \
	Makefile
	#keep it within ${D}
	sed -i -e "s:os.environ\['DESTDIR'\] + '/':'${D}':" \
	scons/rkBuilder.py
}


src_compile() {
	MODEKDE="kde"
	APPNAME="rekall"

	if use rekallqt || use rekallqtonly; then
		MODEQT="qt3"
		if use rekallqtonly ; then
			MODEKDE=
		fi
	fi

	if [ ${MODEKDE} ] && [ ${MODEQT} ] ; then
		einfo "Creating both KDE & QT builds"
		einfo ""
	fi

	for rkbuild in {${MODEKDE},${MODEQT}} ; do
		#refresh the settings file which 
		#is copied over each run
		cp -pPR ${FILESDIR}/24settings settings

		if [ ${rkbuild} = "kde" ] ; then
			einfo "Configuring KDE build"
		else
			APPNAME="rekallqt"
			einfo "Configuring QT build"
		fi
		
		#setup the build mode (kde or qt3) and binary/lib name/prefix
		sed -i -e "s:libprefix=:libprefix=${APPNAME}:" \
		-e "s:appname=:appname=${APPNAME}:" \
		-e "s:mode=:mode=${rkbuild}:" settings
		
		#configure the settings file
		#
		#enable when mdb support is fixed.
		#for myconf in {rekallrt,postgres,mysql,odbc,mdbtools,xbase,sqlite3,debug} ; do
		for myconf in {rekallrt,postgres,mysql,odbc,xbase,sqlite3,debug} ; do
			if use ${myconf} ; then
				myinfo=${myconf}
				if [ ${myconf} = "rekallrt" ] ; then
					myconf="rt"
					myinfo="runtime"
				elif [ ${myconf} = "postgres" ] ; then
					myconf="pgsql"
				# mdb support broken
				#elif [ ${myconf} = "mdbtools" ] ; then
				#	myconf="mdb"
				fi
				einfo "Enabling ${myinfo} support"	
				sed -i -e "s:enable-${myconf}=no:enable-${myconf}=yes:" settings
			fi
		done;

		if use kjs ; then
			if ! use norekallkjs && [ ${rkbuild} = "qt3" ] ; then
				einfo "Enabling builtin KJS support for QT (nonKDE) build"
				sed -i -e "s:enable-kjs=no:enable-kjs=yes:" settings
		
			elif [ ${rkbuild} = "kde" ] ; then
				einfo "Enabling KJS support for KDE build"
				sed -i -e "s:enable-kjs=no:enable-kjs=yes:" settings
			else
				einfo "QT build will be built without KJS support"
			fi
		else
				einfo "KJS support disabled"
		fi

		if [ ${rkbuild} = kde  ]; then
			einfo "make config.${rkbuild}"
			make config.${rkbuild} || die
			#keep within ${D}
			sed -i -e "s:kdedocdir = '/usr/share/doc/HTML':kdedocdir = '${D}/usr/share/doc/HTML':" \
			scons/rkConfig_kde.py
		else
			einfo "make config.${rkbuild}"
			make config.${rkbuild} || die
		fi

		einfo "make ${rkbuild}"
		make ${rkbuild} || die
	done
}

src_install() {
	for rkbuild in {${MODEKDE},${MODEQT}} ; do
		einfo "Installing ${rkbuild} Image"
	 	make install.${rkbuild} || die
	done;
}
