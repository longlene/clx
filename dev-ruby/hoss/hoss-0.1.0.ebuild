# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Index your Chef Server with Elasticsearch"
HOMEPAGE="https://github.com/sczizzo/hoss"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/pmap-1"
ruby_add_rdepend ">=dev-ruby/slog-1"
ruby_add_rdepend ">=dev-ruby/ridley-4.1"
ruby_add_rdepend ">=dev-ruby/elasticsearch-1"

