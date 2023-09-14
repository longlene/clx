# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="riak-client is a rich client for Riak, the distributed database by Basho"
HOMEPAGE="http://github.com/basho/riak-ruby-client"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/beefcake-0.3.7"
ruby_add_rdepend ">=dev-ruby/builder-2.1.2"
ruby_add_rdepend ">=dev-ruby/i18n-0.4.0"
ruby_add_rdepend ">=dev-ruby/innertube-1.0.2"
ruby_add_rdepend ">=dev-ruby/multi_json-1.0"

