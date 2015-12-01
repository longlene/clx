EAPI=5

inherit eutils git-2

DESCRIPTION="Linux kernel headers from the bionic C library"
HOMEPAGE="http://android.git.kernel.org/?p=platform/bionic.git"

LICENSE="BSD"
KEYWORDS="arm x86"

IUSE=""

RDEPEND=""
PROVIDE="elibc_bionic? ( virtual/os-headers )"

SLOT="0"

MY_PN="${PN/-kernel-headers/}"

export CBUILD=${CBUILD:-${CHOST}}
export CTARGET=${CTARGET:-${CHOST}}
if [[ ${CTARGET} == ${CHOST} ]] ; then
	if [[ ${CATEGORY/cross-} != ${CATEGORY} ]] ; then
		export CTARGET=${CATEGORY/cross-}
	fi
fi

is_crosscompile() {
	[[ ${CHOST} != ${CTARGET} ]]
}

bionic_arch() {
	local ctarget
	if is_crosscompile; then
		ctarget=${CTARGET}
	else
		ctarget=${CHOST}
	fi
	case "${ctarget}" in
		*86*|amd64) echo "x86";;
		arm*) echo "arm";;
		sh*) echo "sh";;
		*) ;;
	esac
}

# Bionic uses a git repo. Tags have versions, but the numbering is not 
# compatible with Gentoo's version numbering system.
# Instead, I'm just going to use the 'official' Android release versions
# e.g. 2.3 <=> gingerbread-release <=> \
#      commit 2081fda69a68505c914324797400b1b798516904
#  
# and add -r# for gentoo ebuild revisions and / or bugfixes.

S="${WORKDIR}"/TinyAndroid

src_unpack() {
	local patches p
	local arch=$(bionic_arch)

	[[ -z ${arch} ]] && die "unknown arch"

	# fetch the bionic sources
	EGIT_PROJECT=${PN}/${PN}
	EGIT_COMMIT="2081fda69a68505c914324797400b1b798516904"
#	EGIT_REPO_URI="git://android.git.kernel.org/platform/${MY_PN}.git"
	EGIT_REPO_URI="https://android.googlesource.com/platform/${MY_PN}.git"
	S="${WORKDIR}"/TinyAndroid/${MY_PN} \
		git_fetch

	cd ${S}/${MY_PN}
	patches="$(ls "${FILESDIR}"/${PV}/*.patch 2>/dev/null | sort -u)"
	if [ "${patches}" != "" ]; then
		for p in ${patches}; do 
			EPATCH_OPTS="-p1" \
				epatch ${p}
		done
	fi
}

src_configure() {
	echo -n ""
}
src_compile() {
	echo -n ""
}

src_install() {
	local ic
	local arch="$(bionic_arch)"

	is_crosscompile \
		&& ic=/usr/${CTARGET}/usr/include \
		|| ic=/usr/include

	insinto ${ic}

	# install arch-independent libc headers
	cd ${S}/${MY_PN}/libc/kernel/common
	doins -r *

	# install arch-specific libc headers
	cd ${S}/${MY_PN}/libc/kernel/arch-${arch}
	doins -r *
}
