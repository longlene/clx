# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Her is an ORM that maps REST resources and collections to Ruby objects"
HOMEPAGE="http://her-rb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.5"
ruby_add_rdepend ">=dev-ruby/json-1.8"
ruby_add_rdepend ">=dev-ruby/activemodel-3.0.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">dev-ruby/faraday-0.8"
ruby_add_rdepend ">=dev-ruby/multi_json-1.7"

