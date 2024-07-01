# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2




EAPI=8

PYTHON_COMPAT=( python3_{8..12} )

inherit wrapper python-r1

EGIT_COMMIT="6a00e594c9c2989de23937478f958fcf6bc99264"

DESCRIPTION="Chromium scripts to manage interaction with dependencies"
HOMEPAGE="https://www.chromium.org/developers/how-tos/install-depot-tools/"
SRC_URI="https://chromium.googlesource.com/chromium/tools/depot_tools/+archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE="zsh-completion"
RDEPEND="
	${PYTHON_DEPS}
	dev-vcs/git
"
DEPEND="${RDEPEND}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DOCS_DIR="${WORKDIR}/${P}-docs"
DOCS=( "${DOCS_DIR}"/README{,.gclient,.git-cl}.md "${DOCS_DIR}"/man/html )

src_unpack() {
	mkdir ${P} && pushd ${P} && unpack ${P}.tar.gz && popd
}

src_prepare() {
	rm -f *.bat *.ps1 *.exe ninja* LICENSE .git{i,a}* update_depot_tools*
	rm -r win_toolchain bootstrap

	mkdir "${DOCS_DIR}" "${WORKDIR}/stuff"

	sed -n \
	-e '1p;/^base_dir/p;$p' \
	-i gclient

	echo > .disable_auto_update

	mv man README* "${DOCS_DIR}"
	mv zsh-goodies "${WORKDIR}/stuff"

	default
}

src_install() {
	local inspath=/usr/libexec/"${PN}"

	insinto "${inspath}"
	doins -r *

	exeinto "${inspath}"
	for py in *.py git-* wtf vpython cros cros_sdk chrome_set_ver cbuildbot; do
		local w="${py%%.py}"
		if [[ -f "${w}" ]]; then
			doexe "${w}"
			make_wrapper "$(basename ${w})" "${inspath}/${w}"
		fi
	done

#	make_wrapper "update_depot_tools" "echo -n" "" "" "${inspath}"

	# exeinto "${inspath}/support"
	# doexe support/chromite_wrapper

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins "${WORKDIR}"/stuff/zsh-goodies/_*
	fi

	python_foreach_impl python_fix_shebang -f -q "${D}${inspath}"
	python_foreach_impl python_optimize "${D}${inspath}"

	doman "${DOCS_DIR}/man/man"{1,7}/*

	einstalldocs
}

