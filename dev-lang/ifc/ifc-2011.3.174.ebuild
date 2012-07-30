# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/ifc/ifc-11.1.072.ebuild,v 1.2 2010/11/26 13:09:16 jlec Exp $

EAPI="3"

inherit check-reqs rpm versionator

PB=fcompxe

MY_PLATFORM="intel64"

#PACKAGEID="l_${PB}_p_${PV}"
PACKAGEID="l_${PB}_${MY_PLATFORM}_${PV}"


RELEASE="$(get_version_component_range 1-2)"
BUILD="$(get_version_component_range 3)"
PID=2096

DESCRIPTION="Intel FORTRAN compiler suite for Linux"
HOMEPAGE="http://www.intel.com/software/products/compilers/clin/"
#SRC_COM="http://registrationcenter-download.intel.com/irc_nas/${PID}/${PACKAGEID}"
# NEW TARGETS:
#   http://registrationcenter-download.intel.com/akdlm/irc_nas/2096/l_fcompxe_ia32_2011.3.174.tgz
#   http://registrationcenter-download.intel.com/akdlm/irc_nas/2096/l_fcompxe_intel64_2011.3.174.tgz
SRC_COM="http://registrationcenter-download.intel.com/irc_nas/${PID}/${PACKAGEID}"
SRC_URI="${SRC_COM}.tgz"

LICENSE="Intel-SDP"
SLOT="0"
IUSE="idb +mkl"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

RESTRICT="mirror"

DEPEND=""
RDEPEND="~virtual/libstdc++-3.3
	amd64? ( app-emulation/emul-linux-x86-compat )"

DESTINATION="opt/intel/Compiler/${RELEASE}/${BUILD}"
EDESTINATION="${EROOT#/}${DESTINATION}"

QA_TEXTRELS="${EDESTINATION}/*"
QA_EXECSTACK="${EDESTINATION}/*"
QA_PRESTRIPPED="${EDESTINATION}/lib/*/.*libFNP.so ${EDESTINATION}/bin/*/.* ${EDESTINATION}/idb/*/*/.*"
QA_DT_HASH="
	${EDESTINATION}/bin/*/.*
	${EDESTINATION}/lib/*/.*
	${EDESTINATION}/mkl/lib/*/.*
	${EDESTINATION}/mkl/benchmarks/mp_linpack/bin_intel/*/.*
	${EDESTINATION}/idb/*/*/.*"

pkg_setup() {
	CHECKREQS_MEMORY=1024
	CHECKREQS_DISK_BUILD=1536
	use idb && use mkl && CHECKREQS_DISK_BUILD=2048
	check_reqs
	IARCH=ia32
	use amd64 && IARCH=intel64
	use ia64 && IARCH=ia64
}

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}"/l_* "${S}"
	cd "${S}"
	use idb || rm -f rpms/*idb*.rpm
	use mkl || rm -f rpms/*mkl*.rpm
	if has_version "~dev-lang/icc-${PV}"; then
		rm -f rpms/*cprolib*.rpm
		use idb && built_with_use dev-lang/icc idb && rm -f rpms/*idb*.rpm
		use mkl && built_with_use dev-lang/icc mkl && rm -f rpms/*mkl*.rpm
	fi
	for x in rpms/intel*.rpm; do
		rpm_unpack ./${x} || die "rpm_unpack ${x} failed"
	done
}

src_prepare() {
	# from the PURGE_UB804_FNP in pset/install_fc.sh
	# rm -f "${DESTINATION}"/lib/*/*libFNP.so || die

	# extract the tag function from the original install
	sed -n \
		-e "s|find \$DESTINATION|find ${DESTINATION}|g" \
		-e "s|@\$DESTINATION|@${EROOT}${DESTINATION}|g" \
		-e '/^UNTAG_CFG_FILES[[:space:]]*(/,/^}/p' \
		pset/install.sh > tag.sh || die
	# fix world writeable files
	[[ -d ${DESTINATION}/mkl ]] && chmod 644 \
		${DESTINATION}/mkl/tools/{environment,builder}/* \
		${DESTINATION}/mkl/tools/plugins/*/*
	# remove for collision (bug #288038)
	has_version "~dev-lang/icc-${PV}" && \
		rm -f ${DESTINATION}/lib/*/locale/*/flexnet.cat
}

src_install() {
	einfo "Tagging"
	. ./tag.sh
	UNTAG_CFG_FILES

	keepdir /opt/intel/licenses
	einfo "Copying files"
	dodir "/${DESTINATION}"
	cp -pPR \
		${DESTINATION}/* \
		"${ED}"/${DESTINATION}/ \
		|| die "Copying ${PN} failed"

	local envf=05icfc
	cat > ${envf} <<-EOF
		PATH="${EROOT}${DESTINATION}/bin/${IARCH}"
		ROOTPATH="${EROOT}${DESTINATION}/bin/${IARCH}"
		LDPATH="${EROOT}${DESTINATION}/lib/${IARCH}:${EROOT}${DESTINATION}/idb/lib/${IARCH}"
		LIBRARY_PATH="${EROOT}${DESTINATION}/lib/${IARCH}:${EROOT}${DESTINATION}/idb/lib/${IARCH}"
		NLSPATH="${EROOT}${DESTINATION}/lib/locale/en_US/%N"
		MANPATH="${EROOT}${DESTINATION}/man/en_US"
	EOF
	if [[ ! -e "${EROOT}etc/env.d/${envf}" ]] || \
		[[ -n $(diff "${EROOT}"etc/env.d/${envf} ./${envf}) ]]; then
		doenvd ${envf} || die "doenvd ${envf} failed"
	fi
	[[ -d ${DESTINATION}/idb ]] && \
		dosym ../../common/com.intel.debugger.help_1.0.0 \
		${DESTINATION}/idb/gui/${IARCH}/plugins
}

pkg_postinst() {
	elog "Make sure you have recieved the an Intel license."
	elog "To receive a non-commercial license, you need to register at:"
	elog "http://software.intel.com/en-us/articles/non-commercial-software-development/"
	elog "Install the license file into ${EROOT}opt/intel/licenses."
}
