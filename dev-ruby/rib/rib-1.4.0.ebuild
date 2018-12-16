# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby-Interactive-ruBy -- Yet another interactive Ruby shell

Rib is based on the design of [ripl][] and the work of [ripl-rc][], some of
the features are also inspired by [pry][]"
HOMEPAGE="https://github.com/godfat/rib"

LICENSE="Apache License 2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""


