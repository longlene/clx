# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Hutch is a Ruby library for enabling asynchronous inter-service communication using RabbitMQ"
HOMEPAGE="https://github.com/gocardless/hutch"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bunny-2.2.2"
ruby_add_rdepend ">=dev-ruby/carrot-top-0.0.7"
ruby_add_rdepend ">=dev-ruby/multi_json-1.11.2"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.7.1"

