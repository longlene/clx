# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="pluto-merge - planet site generator (that is, merge 'n' manage planet templates)"
HOMEPAGE="https://github.com/feedreader/pluto-merge"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pluto-models-1.2.2"
ruby_add_rdepend ">=dev-ruby/pakman-0.5.0"
ruby_add_rdepend ">=dev-ruby/fetcher-0.4.4"
