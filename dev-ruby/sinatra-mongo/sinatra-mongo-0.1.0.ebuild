# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="= sinatra-mongo

Extends Sinatra with an extension method for dealing with monogodb using the ruby driver"
HOMEPAGE="http://github.com/technicalpickles/sinatra-mongo"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-1.2.9"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.3"
ruby_add_rdepend ">=dev-ruby/mongo-0"
ruby_add_rdepend ">=dev-ruby/sinatra-0.9.4"

