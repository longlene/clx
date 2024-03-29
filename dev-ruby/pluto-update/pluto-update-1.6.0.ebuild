# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="pluto-update - planet feed 'n' subscription updater"
HOMEPAGE="https://github.com/feedreader/pluto.update"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pluto-models-1.4.0"
ruby_add_rdepend ">=dev-ruby/pluto-feedfetcher-0.1.0"
ruby_add_rdepend ">=dev-ruby/fetcher-0.4.4"
ruby_add_rdepend ">=dev-ruby/preproc-0.1.0"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.13"

