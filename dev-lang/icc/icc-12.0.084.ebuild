# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/icc/icc-11.1.072-r1.ebuild,v 1.1 2010/11/26 13:20:12 jlec Exp $

EAPI="3"

inherit rpm versionator check-reqs

PB=cproc
PACKAGEID="l_ccompxe_${PV}"
PACKAGEID=${PACKAGEID/_12/_2011}
RELEASE="$(get_version_component_range 1-2)"
BUILD="$(get_version_component_range 3)"
PID=1959

DESCRIPTION="Intel compiler suite for Linux"
HOMEPAGE="http://www.intel.com/software/products/compilers/clin/"
SRC_COM="http://registrationcenter-download.intel.com/irc_nas/${PID}/${PACKAGEID}"
SRC_URI="amd64? ( ${SRC_COM/_2011/_intel64_2011}.tgz )
	x86?  ( ${SRC_COM/_2011/_ia32_2011}.tgz )"

LICENSE="Intel-SDP"
SLOT="0"
IUSE="eclipse +idb ipp mkl"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

RESTRICT="mirror"

DEPEND=""
RDEPEND="~virtual/libstdc++-3.3
	amd64? ( app-emulation/emul-linux-x86-compat )
	eclipse? ( >=dev-util/eclipse-sdk-3.4 )"

DESTINATION="opt/intel/composerxe-${PV/12./2011.}"
EDESTINATION="${EROOT#/}${DESTINATION}"

QA_TEXTRELS="${EDESTINATION}/*"
QA_EXECSTACK="${EDESTINATION}/*"
QA_PRESTRIPPED="${EDESTINATION}/compiler/lib/*/.*libFNP.so ${EDESTINATION}/bin/*/.* ${EDESTINATION}/debugger/*/*/.*"
QA_DT_HASH="
	${EDESTINATION}/bin/*/.*
	${EDESTINATION}/compiler/lib/*/.*
	${EDESTINATION}/mkl/lib/*/.*
	${EDESTINATION}/mkl/benchmarks/mp_linpack/bin_intel/*/.*
	${EDESTINATION}/ipp/lib/*/.*
	${EDESTINATION}/debugger/*/*/.*"

pkg_setup() {
	CHECKREQS_MEMORY=1024
	CHECKREQS_DISK_BUILD=3072
	use idb && use ipp && use mkl && CHECKREQS_DISK_BUILD=4096
	check_reqs
	IARCH=ia32
	use amd64 && IARCH=intel64
	use ia64 && IARCH=ia64
}

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}"/l_* "${S}"
	cd "${S}"
	# tbb is open source, thus built from sources in dev-cpp/tbb
	rm -f rpms/*tbb*.rpm
	use idb || rm -f rpms/*idb*.rpm
	use ipp || rm -f rpms/*ipp*.rpm
	use mkl || rm -f rpms/*mkl*.rpm
	use eclipse || rm -f rpms/*cdt*.rpm
	if has_version "~dev-lang/ifc-${PV}"; then
		rm -f rpms/*cprolib*.rpm
		use idb && built_with_use dev-lang/ifc idb && rm -f rpms/*idb*.rpm
		use mkl && built_with_use dev-lang/ifc mkl && rm -f rpms/*mkl*.rpm
	fi
	for x in rpms/intel*.rpm; do
		einfo "Extracting $(basename ${x})..."
		rpm_unpack ./${x} || die "rpm_unpack ${x} failed"
	done
}

link_eclipse_plugins() {
	ECLIPSE_V="$1"
	CDT_V="$2"
	einfo "Linking eclipse (v${ECLIPSE_V}) plugin cdt (v${CDT_V})"
	dodir /usr/$(get_libdir)/eclipse-${ECLIPSE_V}/plugins
	dodir /usr/$(get_libdir)/eclipse-${ECLIPSE_V}/features

	for f in "${DESTINATION}/eclipse_support/cdt${CDT_V}/eclipse/plugins"/*; do
		dosym "${EROOT}${f}" /usr/$(get_libdir)/eclipse-${ECLIPSE_V}/plugins
	done

	for f in "${DESTINATION}/eclipse_support/cdt${CDT_V}/eclipse/features"/*; do
		dosym "${EROOT}${f}" /usr/$(get_libdir)/eclipse-${ECLIPSE_V}/features
	done
	eend $?
}

#src_prepare() {
	#sed -n -e "s|\${SHARED_LOCATION}|${DESTINATION}|g" pset/install.shs || die
	# fix world writeable files
	#[[ -d ${DESTINATION}/mkl ]] && chmod 644 \
	#	${DESTINATION}/mkl/tools/{environment,builder}/* \
	#	${DESTINATION}/mkl/tools/plugins/*/*
	# remove for collision (bug #288038)
	#has_version "~dev-lang/ifc-${PV}" && \
	#	rm -f ${DESTINATION}/lib/*/locale/*/flexnet.cat
#}

src_install() {

	keepdir /opt/intel/licenses
	einfo "Copying files"
	dodir "/${DESTINATION}"
	#cp -pPR ${DESTINATION}/* "${ED}"/${DESTINATION}/ || die "Copying ${PN} failed"
	mv ${DESTINATION}/* "${ED}"/${DESTINATION}/ || die "Copying ${PN} failed"
	#mv "${ED}"/${DESTINATION}/compiler/* "${ED}"/${DESTINATION}/ || die "Copying ${PN} failed"
	#rmdir "${ED}"/${DESTINATION}/compiler
	
	LD=${EROOT}${DESTINATION}/compiler/lib/${IARCH}:${EROOT}${DESTINATION}/debugger/lib/${IARCH}
	use ipp && LD=${LD}:${EROOT}${DESTINATION}/ipp/lib/${IARCH}
	use mkl && LD=${LD}:${EROOT}${DESTINATION}/mkl/lib/${IARCH}
	local envf=05icfc
	cat > ${envf} <<-EOF
		PATH="${EROOT}${DESTINATION}/bin/${IARCH}"
		ROOTPATH="${EROOT}${DESTINATION}/bin/${IARCH}"
		LDPATH="${LD}"
		LIBRARY_PATH="${LD}"
		NLSPATH="${EROOT}${DESTINATION}/compiler/lib/${IARCH}/locale/en_US/%N"
		MANPATH="${EROOT}${DESTINATION}/man/en_US"
	EOF
	doenvd ${envf} || die "doenv ${envf} failed"

	#[[ -d ${DESTINATION}/debugger ]] && \
	#	dosym ../../common/com.intel.debugger.help_1.0.0 \
	#	${DESTINATION}/debugger/gui/${IARCH}/plugins

	if use eclipse; then
		if has_version 'dev-util/eclipse-sdk:3.4'; then
			link_eclipse_plugins "3.4" "5.0" || die
		fi
		if has_version 'dev-util/eclipse-sdk:3.5'; then
			link_eclipse_plugins "3.5" "6.0" || die
		fi
	fi
}

pkg_postinst() {
	elog "Make sure you have recieved the an Intel license."
	elog "To receive a non-commercial license, you need to register at:"
	elog "http://software.intel.com/en-us/articles/non-commercial-software-development/"
	elog "Install the license file into ${EROOT}opt/intel/licenses."
}
