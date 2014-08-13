# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="If you need to send some data to your js files and you don't want to do this with long way trough views and parsing - use this force!"
HOMEPAGE="https://github.com/gazay/gon"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/actionpack-2.3.0"
ruby_add_rdepend ">=dev-ruby/request_store-1.0.5"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/multi_json-0"
ruby_add_rdepend ">=dev-ruby/rabl-0"
ruby_add_rdepend ">=dev-ruby/rabl-rails-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/jbuilder-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

