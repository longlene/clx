# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Communicate with Amazon DynamoDB"
HOMEPAGE="http://github.com/groupme/dynamodb"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/aws4-0.0.2"
ruby_add_rdepend "=dev-ruby/multi_json-1.3.7"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend "=dev-ruby/rspec-2.8.0"
ruby_add_rdepend "=dev-ruby/webmock-1.8.11"

