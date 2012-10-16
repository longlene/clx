# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/icu/icu-4.6.ebuild,v 1.11 2011/04/03 11:46:25 armin76 Exp $

EAPI="3"

inherit eutils versionator

MAJOR_MINOR_VERSION="$(get_version_component_range 1-2)"
MICRO_VERSION="$(get_version_component_range 3)"

DESCRIPTION="International Components for Unicode"
HOMEPAGE="http://www.icu-project.org/"

BASE_URI="http://download.icu-project.org/files/icu4c/${PV}"
DOCS_BASE_URI="http://download.icu-project.org/files/icu4c/${MAJOR_MINOR_VERSION}"
SRC_ARCHIVE="icu4c-${PV//./_}-src.tgz"
DOCS_ARCHIVE="icu4c-${MAJOR_MINOR_VERSION//./_}-docs.zip"

SRC_URI="${BASE_URI}/${SRC_ARCHIVE}
	doc? ( ${DOCS_BASE_URI}/${DOCS_ARCHIVE} )"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="debug doc examples static-libs"

DEPEND="doc? ( app-arch/unzip )"
RDEPEND=""

S="${WORKDIR}/${PN}/source"

QA_DT_NEEDED="/usr/lib.*/libicudata.so.${MAJOR_MINOR_VERSION/./}.${MICRO_VERSION:-0}"

src_unpack() {
	unpack "${SRC_ARCHIVE}"
	if use doc; then
		mkdir docs
		pushd docs > /dev/null
		unpack "${DOCS_ARCHIVE}"
		popd > /dev/null
	fi

	cd ${S}

	local patches p
	patches="$(find "${FILESDIR}"/bionic -name '*.patch' | sort -u)"
	if [ "${patches}" != "" ]; then
		for p in ${patches}; do
			epatch ${p}
		done
	fi
}

src_prepare() {
	# Do not hardcode flags into icu-config.
	# https://ssl.icu-project.org/trac/ticket/6102
	local variable
	for variable in ARFLAGS CFLAGS CPPFLAGS CXXFLAGS FFLAGS LDFLAGS; do
		sed -i -e "/^${variable} =.*/s:@${variable}@::" config/Makefile.inc.in || die "sed failed"
	done

	if [[ "$CBUILD" != "$CHOST" ]]; then

		einfo "preparing native build"
		# fixme: this will break if there are spaces in ${S}
		cp -aR ${S} ${S}.native || die ""
		eend $?

		cd ${S}.native

		einfo "configuring native build"
		CFLAGS="" CXXFLAGS="" \
			./configure --build=$CBUILD --host=$CBUILD --prefix=/usr \
			--disable-samples --disable-static-libs --disable-debug || die
		eend $?

		einfo "makinging native build"
		S=${S}.native \
		CHOST=${CBUILD} \
		emake
		# do not die if this fails... 
		eend $?

		touch ${S}/_cross_compiling_
	fi
}

src_configure() {
	local crossbuilddir

	if [ -f _cross_compiling_ ]; then
		crossbuilddir="--with-cross-build=${S}.native"
	fi

	econf \
		$(use_enable debug) \
		$(use_enable examples samples) \
		$(use_enable static-libs static) \
		${crossbuilddir}
}

src_test() {
	# INTLTEST_OPTS: intltest options
	#   -e: Exhaustive testing
	#   -l: Reporting of memory leaks
	#   -v: Increased verbosity
	# IOTEST_OPTS: iotest options
	#   -e: Exhaustive testing
	#   -v: Increased verbosity
	# CINTLTST_OPTS: cintltst options
	#   -e: Exhaustive testing
	#   -v: Increased verbosity
	emake -j1 check || die "emake check failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dohtml ../readme.html
	dodoc ../unicode-license.txt
	if use doc; then
		insinto /usr/share/doc/${PF}/html/api
		doins -r "${WORKDIR}/docs/"* || die "doins failed"
	fi
}
