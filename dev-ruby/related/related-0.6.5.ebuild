# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Related is a Redis-backed high performance distributed graph database"
HOMEPAGE="http://github.com/sutajio/related/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">dev-ruby/redis-2.0.0"
ruby_add_rdepend ">dev-ruby/redis-namespace-0.8.0"
ruby_add_rdepend ">=dev-ruby/activemodel-0"

