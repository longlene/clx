# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Easy to use gem to send iOS, Android and Windows Phone Push notifications"
HOMEPAGE="https://github.com/calonso/ruby-push-notifications"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/builder-3.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.0"
ruby_add_rdepend ">=dev-ruby/webmock-1.20"

