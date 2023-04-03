# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Tool for managing applications and clouds at shellycloud"
HOMEPAGE="http://shellycloud.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-2.11.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/ruby_gntp-0"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0"
ruby_add_rdepend ">=dev-ruby/fakefs-0.4.3"
ruby_add_rdepend ">=dev-ruby/fakeweb-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/wijet-thor-0.14.10"
ruby_add_rdepend ">=dev-ruby/rest-client-0"
ruby_add_rdepend "<dev-ruby/mime-types-1.16"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/ruby-progressbar-0"
ruby_add_rdepend ">=dev-ruby/launchy-0"
ruby_add_rdepend ">=dev-ruby/netrc-0"
ruby_add_rdepend ">=dev-ruby/childprocess-0.5.5"

