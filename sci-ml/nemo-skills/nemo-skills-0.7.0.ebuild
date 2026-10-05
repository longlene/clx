# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="NeMo Skills - a project to improve skills of LLMs"
HOMEPAGE="
	https://github.com/NVIDIA-NeMo/Skills
"
# No release tags for current mainline (v0.1 is a 2024 snapshot); pin the
# exact commit that nvflow 1.1.1 upstream requires (2026-05-07). The
# in-repo version at that commit is 0.7.0.
EGIT_COMMIT="022904023ad7a83a87662a313cf72e7df5891d55"
SRC_URI="https://github.com/NVIDIA-NeMo/Skills/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/Skills-${EGIT_COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=( "${FILESDIR}"/${PN}-${PV}-no-dynamic-deps.patch )

# Minimal import closure for the pipeline entry points (nemo_skills
# __init__ is version-only; pipeline/__init__ hard-imports nemo_run;
# cluster.py uses huggingface_hub, invoke (fabric) and omegaconf;
# cli/app use typer). Upstream's <0.27 typer ceiling only affects the
# `ns` CLI argument naming, not the library API nvflow consumes, so it
# is not carried. Benchmark/model-client deps (litellm, mcp, openai, ...)
# are lazy imports, see the no-dynamic-deps patch.
# nemo-run and huggingface_hub are python-single-r1 like this ebuild;
# fabric/omegaconf/typer are targets-style and go through
# python_gen_cond_dep.
EPYTEST_PLUGINS=()

RDEPEND="
	>=sci-ml/nemo-run-0.11.1[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/fabric-3.2.2[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		>=dev-python/typer-0.13[${PYTHON_USEDEP}]
	')
"

distutils_enable_tests pytest
