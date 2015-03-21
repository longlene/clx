# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Nesta is a lightweight Content Management System, written in Ruby using
the Sinatra web framework"
HOMEPAGE="http://nestacms.com"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/haml-3.1"
ruby_add_rdepend ">=dev-ruby/sass-3.1"
ruby_add_rdepend ">=dev-ruby/rdiscount-2.1"
ruby_add_rdepend ">=dev-ruby/RedCloth-4.2"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/rack-1.3"
ruby_add_rdepend ">=dev-ruby/mr-sparkle-0.0.2"
ruby_add_rdepend "=dev-ruby/rack-test-0.6.1"
ruby_add_rdepend ">=dev-ruby/rspec-2.14.0"
ruby_add_rdepend "=dev-ruby/test-unit-1.2.3"
ruby_add_rdepend ">=dev-ruby/webrat-0.7.3"

