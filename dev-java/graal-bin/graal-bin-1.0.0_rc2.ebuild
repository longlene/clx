# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit java-vm-2 prefix versionator

KEYWORDS="~amd64"

MY_PV=${PV/_/-}

DESCRIPTION="High-performance polyglot VM"
HOMEPAGE="https://www.graalvm.org"
SRC_URI="amd64? ( https://github.com/oracle/graal/releases/download/vm-${MY_PV}/graalvm-ce-${MY_PV}-linux-amd64.tar.gz )"

LICENSE="Oracle-BCLA-JavaSE"
SLOT="1.0"
IUSE="alsa cups doc +fontconfig headless-awt jce selinux source"
REQUIRED_USE=""
RESTRICT="preserve-libs strip"
QA_PREBUILT="*"

RDEPEND="!x64-macos? (
		!headless-awt? (
			x11-libs/libX11
			x11-libs/libXext
			x11-libs/libXi
			x11-libs/libXrender
			x11-libs/libXtst
		)
	)
	alsa? ( media-libs/alsa-lib )
	cups? ( net-print/cups )
	doc? ( dev-java/java-sdk-docs:${SLOT} )
	fontconfig? ( media-libs/fontconfig:1.0 )
	!prefix? ( sys-libs/glibc:* )
	selinux? ( sec-policy/selinux-java )"

DEPEND=""

S="${WORKDIR}/graalvm-ce-${MY_PV}"

src_install() {
	local dest="/opt/${P}"
	local ddest="${ED}${dest#/}"

	# Create files used as storage for system preferences.
	mkdir jre/.systemPrefs || die
	touch jre/.systemPrefs/.system.lock || die
	touch jre/.systemPrefs/.systemRootModFile || die

	if ! use alsa ; then
		rm -vf jre/lib/*/libjsoundalsa.* || die
	fi

	if use headless-awt ; then
		rm -vf {,jre/}lib/*/lib*{[jx]awt,splashscreen}* \
		   {,jre/}bin/{javaws,policytool} \
		   bin/appletviewer || die
	fi

	dodoc LICENSE
	dodir "${dest}"
	cp -pPR bin include jre lib man "${ddest}" || die

	if use source ; then
		cp -v src.zip "${ddest}" || die
	fi

	# Only install Gentoo-specific fontconfig if flag is disabled.
	# https://docs.oracle.com/javase/8/docs/technotes/guides/intl/fontconfig.html
	if ! use fontconfig ; then
		insinto "${dest}"/jre/lib/
		doins "$(prefixify_ro "${FILESDIR}"/fontconfig.properties)"
	fi

	# Needs to be done before CDS, bug #215225.
	java-vm_set-pax-markings "${ddest}"

	einfo "Creating the Class Data Sharing archives"
	case ${ARCH} in
		arm|ia64)
			${ddest}/bin/java -client -Xshare:dump || die
			;;
		x86)
			${ddest}/bin/java -client -Xshare:dump || die
			# limit heap size for large memory on x86 #467518
			# this is a workaround and shouldn't be needed.
			${ddest}/bin/java -server -Xms64m -Xmx64m -Xshare:dump || die
			;;
		*)
			${ddest}/bin/java -server -Xshare:dump || die
			;;
	esac

	# Remove empty dirs we might have copied.
	find "${D}" -type d -empty -exec rmdir -v {} + || die

	java-vm_install-env "${FILESDIR}"/${PN}.env.sh
	java-vm_revdep-mask
	java-vm_sandbox-predict /dev/random /proc/self/coredump_filter
}

pkg_postinst() {
	java-vm-2_pkg_postinst
}

pkg_postrm() {
	java-vm-2_pkg_postrm
}
