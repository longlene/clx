# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#EAPI=1

inherit eutils versionator

MY_MAJOR=$(get_version_component_range 2)
MY_LETTER=$(get_version_component_range 3)
MY_MINOR=$(get_version_component_range 4)

MY_LOWERS=abcdefghijklmnopqrstuvwxyz
MY_UPPERS=ABCDEFGHIJKLMNOPQRSTUVWXYZ
MY_X=${MY_LOWERS%${MY_LETTER}*}
MY_UPPER=${MY_UPPERS:${#MY_X}:1}

MY_PV=${MY_MAJOR}${MY_UPPER}${MY_MINOR#p}

DESCRIPTION="design system for interactive fiction"
HOMEPAGE="http://www.inform-fiction.org/"
SRC_URI="x86? ( http://www.inform-fiction.org/I7Downloads/I7_${MY_PV}_Linux_i386.tar.gz )
	!x86? ( http://www.inform-fiction.org/I7Downloads/I7_${MY_PV}_Linux_all.tar.gz )"

# "Inform" for the core, "GPL-2" for the i7 user-interface script
LICENSE="Inform GPL-2"
SLOT="7"
#KEYWORDS="-* ~amd64 ~arm ~ppc ~s390 ~x86"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="strip"

DEPEND=""
# i7 is written in perl, and uses uuidgen from e2fsprogs
RDEPEND="dev-lang/perl
	sys-fs/e2fsprogs
	games-engines/frotz
	games-engines/glulxe"
	# Not released yet, use bundled for now
	#>=dev-lang/inform-6.32:6

S="${WORKDIR}/inform7-${MY_PV}"

src_unpack() {
	unpack ${A}
	cd ${S}

	mkdir usr
	cd usr

	case ${ARCH} in
		amd64) IARCH=x86_64   ;;
		arm)   IARCH=armv5tel ;;
		s390)  IARCH=s390     ;; # s390x ?
		x86)   IARCH=i386     ;;
		*)     IARCH=${ARCH}
	esac

	unpack ./../inform7-common_${MY_PV}_all.tar.gz || die
	unpack ./../inform7-compilers_${MY_PV}_${IARCH}.tar.gz || die
	# We don't currently use anything from here, but a future version
	# might include more interpreters.
	unpack ./../inform7-interpreters_${MY_PV}_${IARCH}.tar.gz || die

	epatch "${FILESDIR}"/inform7-4U65-paths.patch
}

src_install() {
	cp -dpPR usr "${D}" || die
	dodoc README || die
	docinto ChangeLogs || die
	dodoc usr/share/doc/inform7/ChangeLogs/*.txt || die
	cd "${D}"/usr || die

	# Don't use the bundled interpreter binaries.  We do, however,
	# keep the bundled Inform 6 compiler, because it has some
	# modifications to work with Inform 7-generated code (these will
	# be released with Inform 6.32).
	#
	# The binaries that we do keep are unpacked into /usr/share with
	# symlinks in /usr/libexec, which is silly; move them to libexec
	# (there doesn't seem to be any need to recreate the symlinks
	# going the other way: the i7 script accesses them from libexec).
	# List the kept binaries explicitly (instead of using a wildcard)
	# so that if a future version adds more, the rmdir will fail and
	# alert the maintainer that changes (new dependencies etc) might
	# be required.
	rm -f libexec/*
	mv share/inform7/Compilers/{ni,cBlorb,inform-6.31-biplatform} libexec || die
	rmdir share/inform7/Compilers || die
	rm share/inform7/Interpreters/{dumb-frotz,dumb-glulxe} || die
	rmdir share/inform7/Interpreters || die

	# It installs README, ChangeLogs and INSTALL to
	# /usr/share/doc/inform7.  We handle README and ChangeLogs above,
	# and there's no point installing INSTALL at all.  Don't use rm
	# -rf so that if a future version adds more files, we'll get an
	# error instead of silently removing them.
	rm share/doc/inform7/README || die
	rm share/doc/inform7/INSTALL || die
	rm share/doc/inform7/ChangeLogs/*.txt || die
	rmdir share/doc/inform7/ChangeLogs || die
	rmdir share/doc/inform7 || die

	mv man share/man || die
}
