# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

LANGS=" ca de es fr hu nl pl ru se sk"

[[ ${PV} = *9999* ]] && VCS_ECLASS="git-2" || VCS_ECLASS=""

inherit multilib toolchain-funcs linux-info qt4-r2 scons-utils ${VCS_ECLASS}

DESCRIPTION="Your friendly chat client"
HOMEPAGE="http://swift.im/"
if [[ ${PV} == *9999* ]] ; then
	EGIT_REPO_URI="git://swift.im/swift"
else
	SRC_URI="http://swift.im/downloads/releases/${P}/${P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
if [[ ${PV} == *9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi

IUSE="avahi debug doc examples +expat ssl static-libs zeroconf"

RDEPEND="
	dev-libs/boost
	expat? ( dev-libs/expat )
	!expat? ( dev-libs/libxml2 )
	ssl? ( dev-libs/openssl )
	zeroconf? (
		avahi? ( net-dns/avahi )
		!avahi? ( net-misc/mDNSResponder )
	)
	net-dns/libidn
	sys-libs/zlib
	x11-libs/libXScrnSaver
	x11-libs/qt-gui
	x11-libs/qt-webkit
"
DEPEND="${RDEPEND}
	doc? (
		>=app-text/docbook-xsl-stylesheets-1.75
		>=app-text/docbook-xml-dtd-4.5
		dev-libs/libxslt
	)
"

scons_vars=()
set_scons_vars() {
	scons_vars=(
		V=1
		allow_warnings=1
		cc="$(tc-getCC)"
		cxx="$(tc-getCXX)"
		ccflags="${CXXFLAGS}"
		linkflags="${LDFLAGS}"
		qt="${S}/local-qt"
		openssl="${EPREFIX}/usr"
		docbook_xsl="${EPREFIX}/usr/share/sgml/docbook/xsl-stylesheets"
		docbook_xml="${EPREFIX}/usr/share/sgml/docbook/xml-dtd-4.5"
		$(use_scons debug)
		$(use !static-libs && use_scons !static-libs swiften_dll)
		$(use_scons ssl openssl)
		$(use zeroconf && use_scons !avahi bonjour)
	)
}

src_prepare() {
	mkdir local-qt
	ln -s "${EPREFIX}"/usr/$(get_libdir)/qt4 local-qt/lib || die
	ln -s "${EPREFIX}"/usr/include/qt4 local-qt/include || die

	cd 3rdParty || die
	# TODO CppUnit, Lua
	rm -rf Boost CAres DocBook Expat LCov LibIDN OpenSSL SCons SQLite ZLib || die
	cd .. || die

	for x in ${LANGS}; do
		if use !linguas_${x}; then
			rm -f Swift/Translations/swift_${x}.ts || die
		fi
	done

	sed -i BuildTools/SCons/Tools/qt4.py \
		-e "s/linux2/linux${KV_MAJOR}/" \
		|| die
}

src_compile() {
	local scons_targets=( Swiften Swift )
	use avahi && scons_targets+=( Slimber )
	use examples && scons_targets+=(
		Documentation/SwiftenDevelopersGuide/Examples
		Limber
		Sluift
		Swiften/Config
		Swiften/Examples
		Swiften/QA
		SwifTools
	)

	set_scons_vars

	escons "${scons_vars[@]}" "${scons_targets[@]}"
}

src_test() {
	set_scons_vars

	escons "${scons_vars[@]}" test=unit QA
}

src_install() {
	set_scons_vars

	escons "${scons_vars[@]}" SWIFT_INSTALLDIR="${D}/usr" SWIFTEN_INSTALLDIR="${D}/usr" "${D}"

	if use avahi ; then
		newbin Slimber/Qt/slimber slimber-qt
		newbin Slimber/CLI/slimber slimber-cli
	fi

	if use examples ; then
		for i in EchoBot{1,2,3,4,5,6} EchoComponent ; do
			newbin "Documentation/SwiftenDevelopersGuide/Examples/EchoBot/${i}" "${PN}-${i}"
		done

		dobin Limber/limber
		dobin Sluift/sluift
		dobin Swiften/Config/swiften-config

		for i in BenchTool ConnectivityTest LinkLocalTool ParserTester SendFile SendMessage ; do
			newbin "Swiften/Examples/${i}/${i}" "${PN}-${i}"
		done
		newbin Swiften/Examples/SendFile/ReceiveFile "${PN}-ReceiveFile"
		use avahi && dobin Swiften/Examples/LinkLocalTool/LinkLocalTool

		for i in ClientTest NetworkTest StorageTest TLSTest ; do
			newbin "Swiften/QA/${i}/${i}" "${PN}-${i}"
		done

		newbin SwifTools/Idle/IdleQuerierTest/IdleQuerierTest ${PN}-IdleQuerierTest
	fi

	use doc && dohtml "Documentation/SwiftenDevelopersGuide/Swiften Developers Guide.html"
}
