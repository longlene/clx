# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

export CBUILD=${CBUILD:-${CHOST}}
export CTARGET=${CTARGET:-${CHOST}}
if [[ ${CTARGET} == ${CHOST} ]] ; then
	if [[ ${CATEGORY/cross-} != ${CATEGORY} ]] ; then
		export CTARGET=${CATEGORY/cross-}
	fi
fi

if [[ ${PV} = *9999* ]] ; then
	cvs_eclass="cvs"
	ECVS_SERVER="sourceware.org:/cvs/pthreads-win32"
	ECVS_MODULE="pthreads"
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi

inherit eutils flag-o-matic versionator virtualx ${cvs_eclass}

MY_PV=$(replace_all_version_separators '-')
MY_P=${PN}-${MY_PV}-release

DESCRIPTION="Implementation of pthreads for Win32"
HOMEPAGE="http://sourceware.org/pthreads-win32"

if [[ ${PV} = *9999* ]] ; then
	S="${WORKDIR}/${ECVS_MODULE}"
else
	SRC_URI="ftp://sourceware.org/pub/pthreads-win32/${MY_P}.tar.gz"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="LGPL-2.1"
SLOT="0"

IUSE="cxx debug test"
RESTRICT="strip test"

DEPEND="test? ( ${CATEGORY}/gcc[openmp] )"
RDEPEND="${DEPEND}"

# First compiler in list is used for libpthread.a symlink
my_compilers() {
	local compilers="G"
	echo ${compilers}
}

# First language in list is used for libpthread.a symlink
my_languages() {
	local languages="C"
	use cxx && languages="${languages} CE"
	echo ${languages}
}

pkg_setup() {
	if [[ ${CBUILD} == ${CHOST} ]] && [[ ${CHOST} == ${CTARGET} ]] ; then
		die "Invalid configuration; do not emerge this directly"
	fi
}

src_prepare() {
	. "${FILESDIR}"/flag-o-matic.eblit

	CHOST=${CTARGET} strip-unsupported-flags

	epatch \
		"${FILESDIR}"/${P}-no-forced-optimisation.patch \
		"${FILESDIR}"/${P}-run-tests-with-wine.patch \
		"${FILESDIR}"/${P}-fix-flags.patch \
		"${FILESDIR}"/${P}-dont-misuse-inline.patch

	if [[ ${PV} != *9999* ]] ; then
		epatch \
		"${FILESDIR}"/${P}-include-stdexcept.patch
	fi
}

src_compile() {
	local compiler language suffix

	for compiler in $(my_compilers) ; do
		for language in $(my_languages) ; do
			for suffix in '' $(use debug && echo -debug) ; do
				emake clean || die
				emake CROSS=${CTARGET}- LDFLAGS="${LDFLAGS} $(test ${language} = CE && echo -lsupc++)" ${compiler}${language}${suffix} || die
			done
		done
	done
}

src_test() {
	local compiler language libgompdll

	. "${FILESDIR}"/find-file-in-path.eblit

	cd tests || die

	libgompdll=`find_file_in_path libgomp-1.dll "$(gcc-config --get-bin-path)"`
	[[ "${libgompdll}" ]] || die

	for compiler in $(my_compilers) ; do
		for language in $(my_languages) ; do
			emake clean || die
			cp "${libgompdll}" . || die
			Xemake CROSS=${CTARGET}- ${compiler}${language} || die
		done
	done
}

src_install() {
	local compiler language debug version=$(get_major_version)

	for compiler in $(my_compilers) ; do
		for language in $(my_languages) ; do
			for suffix in '' $(use debug && echo d) ; do
				insinto /usr/${CTARGET}/usr/bin
				doins pthread${compiler}${language}${version}${suffix}.dll || die

				insinto /usr/${CTARGET}/usr/lib
				doins libpthread${compiler}${language}${version}${suffix}.a || die

				if [ ! -e "${D}"/usr/${CTARGET}/usr/lib/libpthread.a ] ; then
					dosym libpthread${compiler}${language}${version}${suffix}.a /usr/${CTARGET}/usr/lib/libpthread.a || die
				fi
			done
		done
	done

	insinto /usr/${CTARGET}/usr/include
	doins {pthread,sched,semaphore}.h || die
}
