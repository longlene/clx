# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides Rest API access to your models and serves JST pages"
HOMEPAGE="http://github.com/rstacruz/sinatra-backbone"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/sequel-3.25.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.4"
ruby_add_rdepend ">=dev-ruby/contest-0.1.3"
ruby_add_rdepend ">=dev-ruby/mocha-0.13.3"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.2"

