# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A library for streaming MongoDB to SQL"
HOMEPAGE="https://github.com/stripe/mosql"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sequel-0"
ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/log4r-0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend "=dev-ruby/mongoriver-0.4"
ruby_add_rdepend ">=dev-ruby/mongo-1.10"
ruby_add_rdepend ">=dev-ruby/bson-1.10"
ruby_add_rdepend ">=dev-ruby/bson_ext-1.10"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/mocha-0"

