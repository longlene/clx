# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="pluto - Another Planet Generator (Lets You Build Web Pages from Published Web Feeds)"
HOMEPAGE="https://github.com/feedreader/pluto"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pluto-models-1.4.0"
ruby_add_rdepend ">=dev-ruby/pluto-update-1.6.0"
ruby_add_rdepend ">=dev-ruby/pluto-merge-1.1.0"
ruby_add_rdepend ">=dev-ruby/pluto-tasks-1.5.2"
ruby_add_rdepend ">=dev-ruby/gli-2.12.2"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
