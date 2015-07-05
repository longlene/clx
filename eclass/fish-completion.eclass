# Copyright owners: Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: fish-completion.eclass
# @MAINTAINER:
# longlene@gmail.com
# @BLURB: A few quick functions to install fish-completion files
# @EXAMPLE:
#
# @CODE
# EAPI=5
#
# src_configure() {
# 	econf \
#		--with-fish-completion-dir="$(get_fishcompdir)"
# }
#
# src_install() {
# 	default
#
# 	newfishcomp contrib/${PN}.fish-completion ${PN}
# }
# @CODE

inherit toolchain-funcs

case ${EAPI:-0} in
	0|1|2|3|4|4-python|5|5-progress) ;;
	*) die "EAPI ${EAPI} unsupported (yet)."
esac

# @FUNCTION: _fish-completion_get_fishdir
# @INTERNAL
# @DESCRIPTION:
# First argument is name of the string in fish-completion.pc
# Second argument is the fallback directory if the string is not found
# @EXAMPLE:
# _fish-completion_get_fishdir completionsdir /usr/share/fish/completions
_fish-completion_get_fishdir() {
	debug-print-function ${FUNCNAME} "${@}"

	if $(tc-getPKG_CONFIG) --exists fish-completion &>/dev/null; then
		local path="$($(tc-getPKG_CONFIG) --variable=$1 fish-completion)"
		echo "${path#${EPREFIX}}"
	else
		echo $2
	fi
}

# @FUNCTION: _fish-completion_get_fishcompdir
# @INTERNAL
# @DESCRIPTION:
# Get unprefixed fish-completion completions directory.
_fish-completion_get_fishcompdir() {
	debug-print-function ${FUNCNAME} "${@}"

	_fish-completion_get_fishdir completionsdir /usr/share/fish/completions
}

# @FUNCTION: get_fishcompdir
# @DESCRIPTION:
# Get the fish-completion completions directory.
get_fishcompdir() {
	debug-print-function ${FUNCNAME} "${@}"

	echo "${EPREFIX}$(_fish-completion_get_fishcompdir)"
}

# @FUNCTION: dofishcomp
# @USAGE: file [...]
# @DESCRIPTION:
# Install fish-completion files passed as args. Has EAPI-dependant failure
# behavior (like doins).
dofishcomp() {
	debug-print-function ${FUNCNAME} "${@}"

	(
		insinto "$(_fish-completion_get_fishcompdir)"
		doins "${@}"
	)
}

# @FUNCTION: newfishcomp
# @USAGE: file newname
# @DESCRIPTION:
# Install fish-completion file under a new name. Has EAPI-dependant failure
# behavior (like newins).
newfishcomp() {
	debug-print-function ${FUNCNAME} "${@}"

	(
		insinto "$(_fish-completion_get_fishcompdir)"
		newins "${@}"
	)
}

# @FUNCTION: fishcomp_alias
# @USAGE: <basename> <alias>...
# @DESCRIPTION:
# Alias <basename> completion to one or more commands (<alias>es).
fishcomp_alias() {
	debug-print-function ${FUNCNAME} "${@}"

	[[ ${#} -lt 2 ]] && die "Usage: ${FUNCNAME} <basename> <alias>..."
	local base=${1} f
	shift

	for f; do
		dosym "${base}" "$(_fish-completion_get_fishcompdir)/${f}"
	done
}
