# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Command line utilies for interacting with AMQP compliant queues"
HOMEPAGE="http://github.com/dougbarth/amqp-utils"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/amqp-0.7.1"
ruby_add_rdepend ">=dev-ruby/trollop-1.16.2"
ruby_add_rdepend ">=dev-ruby/facets-2.9"
ruby_add_rdepend ">=dev-ruby/clio-0.3.0"
ruby_add_rdepend ">=dev-ruby/json-1.5"
ruby_add_rdepend ">=dev-ruby/heredoc_unindent-1.1.2"
ruby_add_rdepend ">=dev-ruby/msgpack-0.4.5"

